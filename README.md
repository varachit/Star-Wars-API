# Star Wars API

Star Wars API, serves people, planet and starship information within its universe. The application utilised SQLite, a lightweight disk-based database run along with the back-end application and integrated with Redis Caching.

## Preview
[Star Wars @ starwars-varachit.vercel.app](https://starwars-varachit.vercel.app/)\
[Star Wars API @ starwars-api-django.herokuapp.com](https://starwars-api-django.herokuapp.com/)\
[Star Wars API Administration @ starwars-api-django.herokuapp.com/admin](https://starwars-api-django.herokuapp.com/admin)\
(The authorization credentials are provided at Authorization Section)

I deployed the frontend react web-application on [Vercel](https://vercel.com/) and backend API on [Heroku](heroku.com).
On the backend production, PostgreSQL is being used due the better efficiency, approach and the unsupported of SQLite on Heroku.
The Django REST is also linked with Redis Cloud to store and cache data. 
Both servers are hosted in the United States and that might have impacts on loading time due to the high latency from
our current location in Thailand. Building process for both production went well and without any issues.

### Technology on Production
- React 18.0.0 (Frontend) @ Vercel
- Django 4.0.3 (Backend) @ Heroku
- PostgreSQL (Database) @ Heroku
- Redis (Cache Store) @ Redis Cloud


#### Frontend Score from [Checkly](https://www.checklyhq.com/)
- Virtual Experience Score: 100
- Response Time (Total Browser Session): 1.3s
- First Contentful Paint (FCP): 191ms
- Largest Contentful Paint (LCP): 224ms
- Cumulative Layout Shift (CLS - Lower is better): 0
- Total Blocking Time (TBT): 23ms
- Time To First Byte (TTFB): 76ms

## Note
Greeting Mr. Morrison, I'm Varachit Wirunpat. This is my first REST API Django Project.
The reason for choosing Django is that I would like to try something new and challenging 
as to display my fast-learning skill as well as to adapt the existing knowledge with the new framework and tech stack. 
Can't wait to meet with you again soon. Thank you for visiting and have a great day!

## Technology
### Frontend
- Node 16.14.2
- React 18.0.0
- Axios 0.26.1
- Bootstrap 5.1.3
- FontAwesome 6.1.1

### Backend
- Python 3.10.1
- Django 4.0.3
- djangorestframework 3.13.1
- Redis 5.2.0

## Screenshot
### Frontend
![alt text](https://i.imgur.com/XyaXeXT.png)

### Design
![alt text](https://i.imgur.com/iXEgG7y.png)

## Installation
### **Frontend**
- Install dependencies\
  There are several dependencies in which used for the frontend web-application, such as, Bootstrap, Font Awesome and more. Run the following command to install required packages.
  ```
  $ cd frontend
  $ npm install
  ```

- Frontend Project Environment\
  `.env` is applied during the development stage.\
  `.env.production` is applied during the production build or `build:prod`
  ```
  REACT_APP_API_DOMAIN=HOSTNAME
  # REACT_APP_API_DOMAIN=http://127.0.0.1:8000
  ```

- Start React Development Frontend
  ```
  $ npm start
  ```


- Development Build\
  To change environment variable, visit .env
  ```
  $ npm run build:dev
  $ npm install -g serve
  $ serve -s build
  ```

- Production Build\
  To change environment variable, visit .env.production
  ```
  $ npm run build:prod
  $ npm install -g serve
  $ serve -s build
  ```
  
- Dockerizing
  ```
  $ docker build --tag starwars-react .
  $ docker run starwars-react
  $ docker run --publish 3000:3000 starwars-react
  $ docker-compose build .
  $ docker-compose run starwar
  ```

### **Backend**
- Using Local Environment\
  The required packages must be installed on the local environment to run this project,
  If you wish to review the dependencies manually please check requirements.txt. Otherwise,
  simply execute the following command:
  ```
  $ pip install -r requirements.txt
  ```

- Using Project's Virtual Environment

  - Windows:
  ```
  $ .\venv\Scripts\activate.bat
  ```
  
  - Linux/Mac:
  ```
  $ source venv\bin\activate
  ```
  
- Caching\
  Implemented with Redis. The caching option is now disabled to easily maintain during development purposes, seek Project Environment or change configuration in .env to enable data caching.
  Read the following instructions to enable Redis Caching.
  
    - Setup
      - Windows
        1. [Download and Install Redis @ redis.io](https://redis.io/download/#redis-downloads)
        2. Redis service generally auto-start after the installation on Windows
        3. Open Terminal, Command Prompt or command-line interpreter and execute the following command to open Redis CLI:
        ```
        $ redis-cli
        ```
        4. Configure the backend project environment whether on .env or on machine environment. Refer Backend Project Environment.
        
      - Mac
        1. Download and Install Redis with the following command on Terminal:
        ```
        $ brew install redis
        ```
        2. Start service
        ```
        $ brew services start redis
        ```
        3. Connect to Redis using Redis CLI
        ```
        $ redis-cli
        ```
        4. Configure the backend project environment whether on .env or on machine environment. Refer Backend Project Environment.
        
    - Testing
      - Run frontend web-application and backend at the same time
      - Monitor the Redis Server or Caching Server using the following command on Redis CLI
      ```
      $ redis-cli
      $ monitor
      ```
      - All activities will be logged there
      

- Backend Project Environment
  ```
  SECRET_KEY='KEY' # Disabled and using django default 
  # Goto backend/starwars/settings.py to learn more.
  
  DEBUG='True'
  # To use machine environment variable, please see backend/starwars/settings.py
  
  # Caching
  REDIS_CACHING='False'
  REDIS_HOSTNAME=localhost
  REDIS_PORT=6379
  REDIS_USERNAME=USERNAME
  REDIS_PASSWORD=PASSWORD
  REDIS_TTL=3600 # (In seconds)
  ```
- Machine Environment Variable (Optional)\
While committing to the production, it requires effort to change the settings or configurations and re-committing.
With environment variable, these value could be changed within the environment variable on Cloud. 
Currently, it is disabled for convenience purposes. To enable go to backend/starwars/settings.py and uncomment the wanted line.
  
  ```
  SECRET_KEY = 'KEY'
  DEBUG = 'True'
  
  REDIS_CACHING='False'
  REDIS_HOSTNAME=localhost
  REDIS_PORT=6379
  REDIS_USERNAME=USERNAME
  REDIS_PASSWORD=PASSWORD
  REDIS_TTL=3600 # (In seconds)
  ```

- Start Development Backend
  ```
  $ python manage.py runserver 8000
  ```
  
- Dockerizing
  ```
  $ docker build --tag starwars-django .
  $ docker run --publish 8000:8000 starwars-django
  $ docker-compose build .
  $ docker-compose up -d
  ```
  
### - Start the project
  - Frontend
    ```
    $ cd frontend
    $ npm start
    ```

  - Backend
    ```
    $ cd backend
    $ python manage.py runserver 8000
    ```
   
  - Access Local Django Administration or Management Panel\
      Path: [http://127.0.0.1:8000/admin/](http://127.0.0.1:8000/admin/)


  - Access Local React Frontend\
    Path: [http://127.0.0.1:3000/](http://127.0.0.1:3000/)

## Authorization
- Django Administration
  ```
  Username: admin
  Password: #WvpLPf9yHzW
  ```
  ```
  Username: proftom
  Password: kRytPFs_3a4c
  ```

- Authorization Token
  - Pre-generated
`Bearer f095d51254e63e88ab67f730df190bae45e8d549`

To generate authentication token, please visit the endpoint within the Endpoint General Category.

PS. Since this is private repository, I decided to displayed all the credentials' information here.

## Permission
Authenticated User and Administrator User have rights to read, create, update, delete.\
Read-only permission is allowed for the Unauthenticated User.

## Endpoints
### General
| Action 	| Method 	| Endpoint 	|                                                  Description 	                                                   |
|:---:	|:---:	|:---:	|:----------------------------------------------------------------------------------------------------------------:|
| Get access token 	| POST 	| /api/v1/auth/ 	|                                       **Parameters**: Username, Password 	                                       |
| Get the most piloted ship<br>across all of the residents<br>from the specified planets 	| GET 	| /api/v1/most_piloted 	| **Parameter**: planet (Delimited using Commas)<br>Example: /api/v1/most_piloted?planet=Sullust,Corellia,Kashyyyk |

### Starship
| Action 	| Method 	| Endpoint 	| Description 	|
|:---:	|:---:	|:---:	|:---:	|
| Get all starships 	| GET 	| /api/v1/starship/ 	| None 	|
| Get a starship 	| GET 	| /api/v1/starship/{id}/ 	| None 	|
| Search for starship 	| GET 	| /api/v1/starship/search 	| **Parameter**: name<br>Example: /api/v1/starship/search?name=Millennium 	|
| Add a starship 	| POST 	| /api/v1/starship/ 	| Starship Object: JSON Header 	|
| Update a starship 	| PUT 	| /api/v1/starship/{id}/update/ 	| Starship Object: JSON Header 	|
| Delete a starship 	| DELETE 	| /api/v1/starship/{id}/delete/ 	| None 	|

### Planet
| Action 	| Method 	| Endpoint 	| Description 	|
|:---:	|:---:	|:---:	|:---:	|
| Get all planets 	| GET 	| /api/v1/planet/ 	| None 	|
| Get a planet 	| GET 	| /api/v1/planet/{id}/ 	| None 	|
| Search for planet 	| GET 	| /api/v1/planet/search 	| **Parameter**: name<br>Example: /api/v1/planet/search?name=Kashyyyk 	|
| Add a planet 	| POST 	| /api/v1/planet/ 	| Planet Object: JSON Header 	|
| Update a planet 	| PUT 	| /api/v1/planet/{id}/update/ 	| Planet Object: JSON Header 	|
| Delete a planet 	| DELETE 	| /api/v1/planet/{id}/delete/ 	| None 	|

### Person
| Action 	| Method 	| Endpoint 	| Description 	|
|:---:	|:---:	|:---:	|:---:	|
| Get all persons 	| GET 	| /api/v1/person/ 	| None 	|
| Get a person 	| GET 	| /api/v1/person/{id}/ 	| None 	|
| Search for person 	| GET 	| /api/v1/person/search 	| **Parameter**: name<br>Example: /api/v1/person/search?name=Luke 	|
| Add a person 	| POST 	| /api/v1/person/ 	| Person Object: JSON Header 	|
| Update a person 	| PUT 	| /api/v1/person/{id}/update/	| Person Object: JSON Header 	|
| Delete a person 	| DELETE 	| /api/v1/person/{id}/delete/ 	| None 	|
