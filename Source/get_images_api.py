import asyncio
import aiohttp
import os
import time
from lib.download import *


async def async_download_link(session, directory, link):
    """
    Async version of the download_link method we've been using in the other examples.
    :param session: aiohttp ClientSession
    :param directory: directory to save downloads
    :param link: the url of the link to download
    :return:
    """
    download_path = directory / os.path.basename(link)
    async with session.get(link) as response:
        with download_path.open('wb') as f:
            while True:
                # await pauses execution until the 1024 (or less) bytes are read from the stream
                chunk = await response.content.read(1024)
                if not chunk:
                    # We are done reading the file, break out of the while loop
                    break
                f.write(chunk)


# Main is now a coroutine
async def main(links):
    download_dir = setup_download_dir("images")
    # We use a session to take advantage of tcp keep-alive
    # Set a 3 second read and connect timeout. Default is 5 minutes
    async with aiohttp.ClientSession(conn_timeout=3, read_timeout=3) as session:
        tasks = [(async_download_link(session, download_dir, l)) for l in links]
        # gather aggregates all the tasks and schedules them in the event loop
        await asyncio.gather(*tasks, return_exceptions=True)


if __name__ == '__main__':
    # Build list then throttle
    source = get_links('data')
    ts = time.time()
    # Create the asyncio event loop
    loop = asyncio.get_event_loop()
    try:
        for i in range(0, 650, 50):
            loop.run_until_complete(main(source[i:i+50]))
            print(f"throttling after {i} to {i+50}...")
            time.sleep(5)
    finally:
        # Shutdown the loop even if there is an exception
        loop.close()
    dl_time = time.time()-ts
    print(f"Recipe images downloaded in {dl_time}.")

