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

Username: admin
Password: #WvpLPf9yHzW

Username: proftom
Password: kRytPFs_3a4c

Pre-generated Token: `Bearer f095d51254e63e88ab67f730df190bae45e8d549`

PS. Since this is private repository, I decided to displayed all the credentials information on this file.

## Endpoints
### General
| Action 	| Method 	| Endpoint 	| Description 	|
|:---:	|:---:	|:---:	|:---:	|
| Get access token 	| POST 	| /api/v1/auth/ 	| Parameters: Username, Password 	|
| Get the most piloted ship<br>across all of the residents<br>from the specified planets 	| GET 	| /api/v1/most_piloted 	| Parameter: planet \| List: Planet name (Delimited using Commas)<br>Example: /api/v1/most_piloted?planet=Sullust,Corellia,Kashyyyk 

### Starships
| Action 	| Method 	| Endpoint 	| Description 	|
|:---:	|:---:	|:---:	|:---:	|
| Get all starships 	| GET 	| /api/v1/starship/ 	| None 	|
| Get a starship 	| GET 	| /api/v1/starship/{id} 	| None 	|
| Search for starship 	| GET 	| /api/v1/starship/search 	| Parameter: name<br>Example: /api/v1/starship/search?name=Millennium 	|
| Add a starship 	| POST 	| /api/v1/starship/ 	| Starship Object: JSON Header 	|
| Update a starship 	| PUT 	| /api/v1/starship/{id}/update 	| Starship Object: JSON Header 	|
| Delete a starship 	| DELETE 	| /api/v1/starship/{id}/delete 	| None 	|
