# Star Wars API
Based on Python 3.10.1 with Maven project management, the application built with in-memory database H2, or an embedded relation database management system that runs along with the program. 

## Technology
### Backend
- Django


## Endpoints
| Action                                                                           | Method | Endpoint                     |
|----------------------------------------------------------------------------------|--------|------------------------------|
| Get the most piloted ship across all of the residents from the specified planets |   GET  | /api/v1/most_piloted         |
| Get all starships                                                                |   GET  | /api/v1/starship/            |
| Get a starship                                                                   |   GET  | /api/v1/starship/{id}        |
| Search for starship                                                              |   GET  | /api/v1/starship/search      |
| Add a starship                                                                   |  POST  | /api/v1/starship/            |
| Update a starship                                                                |   PUT  | /api/v1/starship/{id}/update |
| Delete a starship                                                                | DELETE | /api/v1/starship/{id}/delete |
