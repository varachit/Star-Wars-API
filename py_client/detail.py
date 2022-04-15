import requests
import json

planet = []
count = 0
hasNext = True
endpoint = "https://swapi.dev/api/planets/"

while hasNext:
    response = requests.get(endpoint)
    json_response = json.loads(response.text)
    planet.extend(iter(json_response["results"]))
    if json_response["next"] is None:
        count = json_response["count"]
        hasNext = False
    else:
        nextEndpoint = json_response["next"]
        endpoint = nextEndpoint.replace('&format=json', '')

print(f'Total number of planets in local: {len(planet)} | Actual number of planets in SWAPI: {count}')
for eachPlanet in planet:
    name = eachPlanet["name"]
    residents = eachPlanet["residents"]
