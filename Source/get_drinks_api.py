import asyncio
import aiohttp

from aiohttp import ClientSession



class AsyncRequest:

    async def fetch(self, url: str, session: ClientSession, **kwargs):
        response = await session.request(method="GET", url = url, **kwargs)
        response.raise_for_status()
        data = await response.json()
        return data

    async def parse(self, url: str, **kwargs):
        try:
            data = await self.fetch(url, **kwargs)
        except (aiohttp.ClientError,
                aiohttp.http_exceptions.HttpProcessingError) as e:
            return e
        except Exception as e:
            return e
        return data

    async def single(self, url: str, res_list: list, **kwargs):
        result = await self.parse(url, **kwargs) # session buried
        if not result: return None
        res_list.append(result)

    async def bulk_crawl(self, urls: set, res: list):
        timeout = aiohttp.ClientTimeout(total=30)
        async with ClientSession(timeout=timeout) as session:
            tasks = []
            for url in urls:
                tasks.append(self.single(url, res, session=session))
            await asyncio.gather(*tasks)
            

class File:

    def read(self, character):
        file = f"data/{character}_drinks.json"
        with open(file) as fd:
            content = fd.read()
        return json.loads(content)

    def write(self, char, r):
        file_name = f"data/{char}_drinks.json"
        with open(file_name, "w") as fd:
            fd.write(json.dumps(r[0]))


def main(urls, r):
    obj = AsyncRequest()
    asyncio.run(obj.bulk_crawl(urls, r))
    print("finish?")


if __name__ == "__main__":
    # Args
    import sys
    import json
    character = sys.argv[1]
    result = []
    # By ID
    #source = ['https://www.thecocktaildb.com/api/json/v2/9973533/lookup.php?i=13196']

    # By alpha and arg
    source = [f'https://www.thecocktaildb.com/api/json/v2/9973533/search.php?f={character}']
    args = [source, result]
    main(*args)
    # Write and read file
    f = File()
    f.write(character, result)
    contents = f.read(character)
    for item in contents['drinks']:
        print(item['idDrink'])

