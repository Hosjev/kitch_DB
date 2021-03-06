import json
import os
from pathlib import Path
from lib.readdata import File
from collections import defaultdict


class Category:

    def read(self, file):
        with open(file) as fd:
            contents = json.loads(fd.read())
        return contents

    def write(self, content, file):
        with open(file, "w") as fd:
            fd.write(json.dumps(list(sorted(content)), indent=4))


def sanitize_word(s) -> str:
    return s.replace("'", "''")


def sanitize_ingredient(s) -> str:
    """Sanitize every ingredient value by Capitializing between spaces and 1st of dashes"""
    i = list()
    for w in s.split():
        if "-" in w:
            temp = w.split('-')
            temp[0] = temp[0][0].upper() + temp[0][1:]
            for x in range(1, len(temp)): temp[x] = temp[x][0].lower() + temp[x][1:]
            temp = "-".join(temp)
        else:
            temp = w[0].upper() + w[1:]
        i.append(temp)
    return " ".join(i).rstrip()


def sanitize_instructions(obj):
    """
    Remove all return characters and double quotes.
    For Postgres, insert single quote in front of single quote.
    """
    obj = " ".join(obj.split())
    obj = " ".join(obj.split('"'))
    obj = obj.replace("'", "''")
    obj = obj.replace("\\", "")
    return obj


def parse_ingredients(obj) -> dict:
    """1) Read json category set and adjust, 2) Add I/M to obj"""
    ingredient_obj = {}
    for k,v in obj.items():
        if v and k.__contains__('Ingredient'):
            string = sanitize_ingredient(v)
            measure = obj[k.replace("Ingredient", "Measure")]
            if not measure:
                ingredient_obj[string] = "to Taste"
            else:
                ingredient_obj[string] = measure.rstrip()
    return ingredient_obj


def parse_categories(cat, backend_table, other_cat) -> set:
    """We assume 'other' is definitive, as we've already set a 'type':
        1) liquid
        2) fruit
        3) syrup
        4) spice
        5) bitters
        6) extra
    """
    ingredient_set, booze_set = set(), set()
    list_of_other = [i[0] for i in other_cat]
    # Set full list to compare booze to other
    for obj in backend_table:
        [ingredient_set.add(k) for k,v in obj['ingredients'].items()]
    for i in sorted(ingredient_set):
        if i not in list_of_other: booze_set.add(i)
    # Assume we know OTHER category better
    cat.write(booze_set, "categories/booze.json")
    return booze_set



def main():
    """
    Objects to read:
      1) B/O.json
      2) each data file
    Objects to write:
      1) output_object [{individual drink}, ...]
      2) B/O.json categories (sets to json files)
      3) sql files: B/O.sql, backend_drinks.sql, schema.sql
    Steps:
    1) read each data file
      a) object {...}
        1) parse d_id, name, type, category, image_name, instructions (add all to output_object)
        2) for type, category, name Cap for each word (sep space)
        3) parse ingredients:
          a) for word in ingreds where not None, Cap word (sep space/dash...)
          b) for word, if word not in Other category (json read), add to Booze
          c) for sanitized word, add to output_object {word: matching measure ("to Taste" if None)}
    """
    backend_table = list()

    # By alpha
    import string
    f = File()
    for char in string.ascii_lowercase:
        contents = f.read(char)
        if contents: # entire file
            for obj in contents['drinks']:
                out_obj = {}
                out_obj['drink_id'] = obj['idDrink']
                out_obj['name'] = sanitize_word(obj['strDrink'])
                out_obj['type'] = sanitize_word(obj['strCategory'])
                out_obj['container'] = sanitize_word(obj['strGlass'])
                out_obj['image'] = os.path.basename(obj['strDrinkThumb'])
                out_obj['instructions'] = sanitize_instructions(obj['strInstructions'])
                out_obj['ingredients'] = parse_ingredients(obj)
                backend_table.append(out_obj)

    # This part has to be manually inspected every time we update Database w/new API info
    cat = Category()
    other_cat = cat.read("categories/other_with_types.json")
    booze_set = parse_categories(cat, backend_table, other_cat)

    # Write backend Sql file
    source = ["  ('"+x+"')," for x in booze_set]
    f.write("sql", "booze.sql", sorted(source))
    # ('milk' (select id from drink_other_cats where name = 'liquid')),
    source = ["  ('"+x[0]+"', (select id from drink_other_cats where name = '"+x[1]+"'))," for x in other_cat]
    #source = ["  ('"+x+"')," for x in other_cat]
    f.write("sql", "other.sql", sorted(source))

    # Finally, write data for main table
    source = list()
    for obj in backend_table:
        source.append("  (")
        for k,v in obj.items():
            if k == "drink_id": source.append(f"    {v},")
            elif k == "ingredients": source.append(f"    '{json.dumps(v, ensure_ascii=False)}'")
            else: source.append(f"    '{v}',")
        source.append("  ),")
    f.write("sql", "backend_table.sql", source)


if __name__ == "__main__":
    main()
