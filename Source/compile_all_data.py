import json
import os
from pathlib import Path
from lib.readdata import File
from collections import defaultdict


if __name__ == "__main__":
    # By alpha and arg
    import string
    source = defaultdict(set)
    f = File()
    # "strIngredient1": "White Rum"
    # "strMeasure1": "1.5 cl"
    # Data structure
    #  { 'White Rum': ['1.5 cl', '2 oz']...
    for char in string.ascii_lowercase:
        contents = f.read(char)
        if contents:
            for obj in contents['drinks']:
                # ('White Rum', '1.5 cl'),
                # ('White Rum', '2 oz'),
                for k,v in obj.items():
                    if v and k.__contains__('Ingredient'):
                        m_num = k.replace('Ingredient', 'Measure')
                        source[v].add(obj[m_num])

    for k,v in source.items(): print(k,v)
    exit()
    # Write to file
    # source.add(f"  (\'{i['strGlass']}\'),")
    cdir = "sql"
    fname = "glass.sql"
    f.write(cdir, fname, source)
