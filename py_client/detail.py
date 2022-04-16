import requests
import json

people = []
count = 0
hasNext = True
endpoint = "https://swapi.dev/api/people/"

while hasNext:
    response = requests.get(endpoint)
    json_response = json.loads(response.text)
    people.extend(iter(json_response["results"]))
    if json_response["next"] is None:
        count = json_response["count"]
        hasNext = False
    else:
        nextEndpoint = json_response["next"]
        endpoint = nextEndpoint.replace('&format=json', '')

print(f'Total number of people in local: {len(people)} | Actual number of people in SWAPI: {count}')
for person in people:
    name = person["name"]
    homeworld = person["homeworld"]
    starship = person["starships"]

    print(f'Name: {name}')
    if homeworld is not None:
        each_homeworld_response = requests.get(homeworld)
        print(f'Homeworld: {json.loads(each_homeworld_response.text)["name"]}')
    else:
        print('Homeworld: None\n')

    print('Starship:')
    if len(starship) > 0:
        for each_starship_url in starship:
            each_starship_response = requests.get(each_starship_url)
            print(f'{json.loads(each_starship_response.text)["name"]}')
    else:
        print('None')
    print('\n\n')
