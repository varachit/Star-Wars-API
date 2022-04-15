# Star Wars API
Star Wars REST API, serves people, planet and starship within its universe. Based on Django 4.0.3, Python 3.10.1, the application utilised SQLite, a lightweight disk-based database run along with the application.

## Technology
### Backend
- Django

## Technology
### Installation
- Using Local Environment
  The required packages must be installed on the local environment,
  
  Consult requirements.txt or simply execute the following command:
  
  `pip install -r requirements.txt`
- Using Project's Python Virtual Environment
  #### Windows:
  `.\venv\Scripts\activate.bat`

  #### Linux/Mac:
  `source venv\bin\activate`
  
- Start the project

  `python backend/manage.py runserver 8000`
  
- Access Django Administration or Management Panel

  Path: `127.0.0.1:8000/admin/`

## Authorization
### Django Administration

Username: `admin`
Password: `#WvpLPf9yHzW`

Username: `proftom` 
Password: `kRytPFs_3a4c`

Pre-generated Token: `Bearer f095d51254e63e88ab67f730df190bae45e8d549`
To generate authentication token, please visit the endpoint within the general category.

PS. Since this is private repository, I decided to displayed all the credentials information on this file.

## Endpoints
### General
| Action 	| Method 	| Endpoint 	| Description 	|
|:---:	|:---:	|:---:	|:---:	|
| Get access token 	| POST 	| /api/v1/auth/ 	| Parameters: Username, Password 	|
| Get the most piloted ship<br>across all of the residents<br>from the specified planets 	| GET 	| /api/v1/most_piloted 	| Parameter: planet \| List: Planet name (Delimited using Commas)<br>Example: /api/v1/most_piloted?planet=Sullust,Corellia,Kashyyyk 

### Starship
| Action 	| Method 	| Endpoint 	| Description 	|
|:---:	|:---:	|:---:	|:---:	|
| Get all starships 	| GET 	| /api/v1/starship/ 	| None 	|
| Get a starship 	| GET 	| /api/v1/starship/{id} 	| None 	|
| Search for starship 	| GET 	| /api/v1/starship/search 	| Parameter: name<br>Example: /api/v1/starship/search?name=Millennium 	|
| Add a starship 	| POST 	| /api/v1/starship/ 	| Starship Object: JSON Header 	|
| Update a starship 	| PUT 	| /api/v1/starship/{id}/update 	| Starship Object: JSON Header 	|
| Delete a starship 	| DELETE 	| /api/v1/starship/{id}/delete 	| None 	|

### Planet
| Action 	| Method 	| Endpoint 	| Description 	|
|:---:	|:---:	|:---:	|:---:	|
| Get all planets 	| GET 	| /api/v1/planet/ 	| None 	|
| Get a planet 	| GET 	| /api/v1/planet/{id} 	| None 	|
| Search for planet 	| GET 	| /api/v1/planet/search 	| Parameter: name<br>Example: /api/v1/planet/search?name=Kashyyyk 	|
| Add a planet 	| POST 	| /api/v1/planet/ 	| Planet Object: JSON Header 	|
| Update a planet 	| PUT 	| /api/v1/planet/{id}/update 	| Planet Object: JSON Header 	|
| Delete a planet 	| DELETE 	| /api/v1/planet/{id}/delete 	| None 	|

### Person
| Action 	| Method 	| Endpoint 	| Description 	|
|:---:	|:---:	|:---:	|:---:	|
| Get all persons 	| GET 	| /api/v1/person/ 	| None 	|
| Get a person 	| GET 	| /api/v1/person/{id} 	| None 	|
| Search for person 	| GET 	| /api/v1/person/search 	| Parameter: name<br>Example: /api/v1/person/search?name=Luke 	|
| Add a person 	| POST 	| /api/v1/person/ 	| Person Object: JSON Header 	|
| Update a person 	| PUT 	| /api/v1/person/{id}/update 	| Person Object: JSON Header 	|
| Delete a person 	| DELETE 	| /api/v1/person/{id}/delete 	| None 	|
