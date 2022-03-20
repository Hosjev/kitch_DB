import json
import os
from pathlib import Path
from lib.readdata import File
from collections import defaultdict


def build(source, contents):
    for obj in contents['drinks']:
        for k,v in obj.items():
            if v and k.__contains__('Ingredient'):
                string = str()
                for word in v.split():
                    string += word[0].upper() + word[1:] + " "
                source.add(string.rstrip())


if __name__ == "__main__":
    # By alpha and arg
    import string
    source = set()
    f = File()
    # "strIngredient1": "White Rum"
    for char in string.ascii_lowercase:
        contents = f.read(char)
        if contents:
            build(source, contents)

    sql_source = list()
    for item in sorted(source):
        sql_source.append(f"  (\'{item}\'),")
    # Write to file
    cdir = "sql"
    fname = "ingredients.sql"
    f.write(cdir, fname, sql_source)
