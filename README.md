# Star Wars API
Based on Python 3.10.1 with Maven project management, the application built with in-memory database H2, or an embedded relation database management system that runs along with the program. 

## Technology
### Backend
- Django

## Technology
### Installation
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
