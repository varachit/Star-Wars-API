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


## Endpoints
### Starships
|                                      Action                                      | Method |           Endpoint           |                                                           Description                                                          |
|:--------------------------------------------------------------------------------:|:------:|:----------------------------:|:------------------------------------------------------------------------------------------------------------------------------:|
| Get the most piloted ship across all of the residents from the specified planets |   GET  | /api/v1/most_piloted         | Parameter: planet \| List: Planet name (Delimited using Commas) Example: /api/v1/most_piloted?planet=Sullust,Corellia,Kashyyyk |
| Get all starships                                                                |   GET  | /api/v1/starship/            |                                                              None                                                              |
| Get a starship                                                                   |   GET  | /api/v1/starship/{id}        |                                                              None                                                              |
| Search for starship                                                              |   GET  | /api/v1/starship/search      |                    Parameter: name \| String: Starship name Example: /api/v1/starship/search?name=Millennium                   |
| Add a starship                                                                   |  POST  | /api/v1/starship/            |                                                  Starship Object: JSON Header                                                  |
| Update a starship                                                                |   PUT  | /api/v1/starship/{id}/update |                                                  Starship Object: JSON Header                                                  |
| Delete a starship                                                                | DELETE | /api/v1/starship/{id}/delete |                                                              None                                                              |
