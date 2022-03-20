import json
import os
from pathlib import Path


class File:

    def read(self, character):
        file = f"data/{character}_drinks.json"
        try:
            with open(file) as fd:
                content = fd.read()
            return json.loads(content)
        except:
            return

    def write(self, directory, name, text):
        file_name = f"{directory}/{name}"
        with open(file_name, "w") as fd:
            for i in text:
                fd.write(i)
                fd.write('\n')
