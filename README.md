# Star Wars API
Star Wars REST API, serves people, planet and starship information within its universe. Based on Django 4.0.3, Python 3.10.1, the application utilised SQLite, a lightweight disk-based database run along with the back-end application.

## Note
Greeting Mr. Morrison, I'm Varachit Wirunpat. This is my first REST API Django Project. The reason for choosing Django is because I would like to try something new and challenging as to adapt the existing knowledge with the new framework. Thank you for visiting and have a great day!

## Technology
### Frontend
- React 18.0.0
- Axios 0.26.1

### Backend
- Python 3.10.1
- Django 4.0.3

## Screenshot
### React Frontend
![alt text](https://i.imgur.com/XyaXeXT.png)

## Design
![alt text](https://i.imgur.com/iXEgG7y.png)

## Installation
### **Frontend**
- Install dependencies
  ```
  cd frontend
  npm install
  ```

- Start Development React Frontend
  ```
    npm start
  ```


- Production Build
  ```
    npm run build
    npm install -g serve
    serve -s build
  ```

### **Backend**
- Using Local Environment\
  The required packages must be installed on the local environment to run this project,
  If you wish to review the dependencies manually please check requirements.txt. Otherwise,
  simply execute the following command:
  ```
  pip install -r requirements.txt
  ```

- Using Project's Python Virtual Environment

  - Windows:
  ```
  .\venv\Scripts\activate.bat
  ```
  
  - Linux/Mac:
  ```
  source venv\bin\activate
  ```
  
### - Start the project
  ```
  cd backend
  python manage.py runserver 8000
  cd ..
  cd frontend
  npm start
  ```
    
- Access Django Administration or Management Panel

  Path: `http://127.0.0.1:8000/admin/`


- Access React Frontend\
  Path: `http://127.0.0.1:3000/`

## Authorization
- Django Administration
  ```
  Username: `admin`
  Password: `#WvpLPf9yHzW`
  ```
  ```
  Username: `proftom` 
  Password: `kRytPFs_3a4c`
  ```

- Authorization Token
  - Pre-generated
`Bearer f095d51254e63e88ab67f730df190bae45e8d549`

To generate authentication token, please visit the endpoint within the general category.

PS. Since this is private repository, I decided to displayed all the credentials' information here.

## Permission
Authenticated User and Administrator User have rights to read, create, update, delete.\
Read-only permission is allowed for the Unauthenticated User.

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
| Get a starship 	| GET 	| /api/v1/starship/{id}/ 	| None 	|
| Search for starship 	| GET 	| /api/v1/starship/search 	| Parameter: name<br>Example: /api/v1/starship/search?name=Millennium 	|
| Add a starship 	| POST 	| /api/v1/starship/ 	| Starship Object: JSON Header 	|
| Update a starship 	| PUT 	| /api/v1/starship/{id}/update/ 	| Starship Object: JSON Header 	|
| Delete a starship 	| DELETE 	| /api/v1/starship/{id}/delete/ 	| None 	|

### Planet
| Action 	| Method 	| Endpoint 	| Description 	|
|:---:	|:---:	|:---:	|:---:	|
| Get all planets 	| GET 	| /api/v1/planet/ 	| None 	|
| Get a planet 	| GET 	| /api/v1/planet/{id}/ 	| None 	|
| Search for planet 	| GET 	| /api/v1/planet/search 	| Parameter: name<br>Example: /api/v1/planet/search?name=Kashyyyk 	|
| Add a planet 	| POST 	| /api/v1/planet/ 	| Planet Object: JSON Header 	|
| Update a planet 	| PUT 	| /api/v1/planet/{id}/update/ 	| Planet Object: JSON Header 	|
| Delete a planet 	| DELETE 	| /api/v1/planet/{id}/delete/ 	| None 	|

### Person
| Action 	| Method 	| Endpoint 	| Description 	|
|:---:	|:---:	|:---:	|:---:	|
| Get all persons 	| GET 	| /api/v1/person/ 	| None 	|
| Get a person 	| GET 	| /api/v1/person/{id}/ 	| None 	|
| Search for person 	| GET 	| /api/v1/person/search 	| Parameter: name<br>Example: /api/v1/person/search?name=Luke 	|
| Add a person 	| POST 	| /api/v1/person/ 	| Person Object: JSON Header 	|
| Update a person 	| PUT 	| /api/v1/person/{id}/update/	| Person Object: JSON Header 	|
| Delete a person 	| DELETE 	| /api/v1/person/{id}/delete/ 	| None 	|
