import json
import os
from pathlib import Path
from urllib.request import urlopen
import sys



def get_links(directory):
    """Get all 'strThumb' image links from data directory"""
    links = list()
    directory = Path(Path.cwd(), directory)
    for j_file in directory.glob('*.json'):
        with open(j_file) as fd:
            contents = json.loads(fd.read())
        for item in contents["drinks"]:
            links.append(item["strDrinkThumb"])
    return links


def download_link(directory, link):
    """Takes 2 pos args: where to download to, url to download"""
    pos_url = Path(link)
    download_path = directory.joinpath(pos_url.name)
    content = urlopen(link)
    with open(download_path, "wb") as f:
        f.write(content.read())
    dl_logger.info(f"Downloaded: {link}")


def setup_download_dir(directory):
    download_dir = Path(Path.cwd(), directory)
    if not download_dir.exists():
        download_dir.mkdir()
    return download_dir
