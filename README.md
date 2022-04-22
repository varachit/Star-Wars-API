# Star Wars API
[![Build Status](https://app.travis-ci.com/z3r0k0r3/Star-Wars-API.svg?token=4NGUqs3xY87p8AbzrFZq&branch=master)](https://app.travis-ci.com/z3r0k0r3/Star-Wars-API)


Star Wars API, serves people, planet and starship information within its universe. The application utilised SQLite, 
a lightweight disk-based database run along with the back-end application and integrated with Redis Caching.

## Project Instruction
In a galaxy far far away…
 
Using the Star Wars API (swapi.dev), build an API (you may use a framework like Django or Express, etc.) that, 
given a list of planets, locates the most piloted ship across all the residents from those planets. 
Your API should return the model of the ship. If there is a tie return all the tied ships.
 
You will need to make various design decisions such as how your API receives the list of planets.
Documentation on the Star Wars API can be found here: [swapi.dev/documentation](swapi.dev/documentation).
A full list of planets can be found here [swapi.dev/api/planets](swapi.dev/api/planets),
and there are similar routes for ships and people.
 
An example: if your API received `Sullust, Corellia and Kashyyyk`\
The result returned should be `YT-1300 light freighter`
 
Additional credit is awarded for API improvements such as reducing loading times (e.g. through caching), and so on.

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
- Django 4.0.4 (Backend) @ Heroku
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
- Django 4.0.4
- djangorestframework 3.13.1
- django-redis 5.2.0
- algoliasearch-django 2.0.0

## Screenshot
### Frontend
![alt text](https://i.imgur.com/XyaXeXT.png)

### Design
![alt text](https://i.imgur.com/ftTY5Jj.png)
![alt text](https://i.imgur.com/Xf30LHU.png)
![alt text](https://i.imgur.com/PBTC11Q.png)

### Database Query
```
SELECT 
    api_planet.name AS planet_name, 
    api_person.name AS person_name,
    api_starship.id AS starship_id, 
    api_starship.name AS starship_name
FROM api_starship

-- Join with the Relationship Table and Another Entity Table   
LEFT OUTER JOIN api_person_starships
    ON api_starship.id = api_person_starships.starship_id
LEFT OUTER JOIN api_person
    ON api_person_starships.person_id = api_person.id
	
LEFT OUTER JOIN api_person_homeworld
    ON api_person.id = api_person_homeworld.person_id
LEFT OUTER JOIN api_planet
    ON api_person_homeworld.planet_id = api_planet.id

WHERE api_planet.name IN ('Sullust', 'Corellia', 'Kashyyyk') 
      
-- WHERE api_planet.name = "Sullust" 
--    OR api_planet.name = "Corellia"
--    OR api_planet.name = "Kashyyyk"
    
ORDER BY api_planet.name, api_person.name, api_starship.id;
```

**Action:** `Get the all information on starship and residents in the target planets`\
**Target planets:** `Sullust, Corellia and Kashyyyk`\
**Result:**

| **planet_name** 	| **person_name** 	| **starship_id** 	| **starship_name** 	|
|---	|---	|---	|---	|
| Corellia 	| Han Solo 	| 10 	| Millennium Falcon 	|
| Corellia 	| Han Solo 	| 17 	| Imperial shuttle 	|
| Corellia 	| Wedge Antilles 	| 12 	| X-wing 	|
| Kashyyyk 	| Chewbacca 	| 10 	| Millennium Falcon 	|
| Kashyyyk 	| Chewbacca 	| 17 	| Imperial shuttle 	|
| Sullust 	| Nien Nunb 	| 10 	| Millennium Falcon 	|
```
SELECT
    api_starship.id AS starship_id, 
    api_starship.name AS starship_name,
    api_starship.model AS starship_model,
    COUNT(api_starship.id) AS starship_count
FROM api_starship
   
LEFT OUTER JOIN api_person_starships
    ON api_starship.id = api_person_starships.starship_id
LEFT OUTER JOIN api_person
    ON api_person_starships.person_id = api_person.id
	
LEFT OUTER JOIN api_person_homeworld
    ON api_person.id = api_person_homeworld.person_id
LEFT OUTER JOIN api_planet
    ON api_person_homeworld.planet_id = api_planet.id
	
WHERE api_planet.name IN ('Sullust', 'Corellia', 'Kashyyyk') 
	
-- WHERE api_planet.name = "Sullust" 
--     OR api_planet.name = "Corellia"
--     OR api_planet.name = "Kashyyyk"

GROUP BY api_starship.id
ORDER BY starship_count DESC;
```

**Action:** `Get the starship information owned by the residents in the target planets`\
**Description** `starship_count is the amount of starship piloted by the people who reside in the target planets`\
**Target planets:** `Sullust, Corellia and Kashyyyk`\
**Result:**

| **starship_id** 	| **starship_name** 	| **starship_model** 	| **starship_count** 	|
|:---:	|:---:	|:---:	|:---:	|
| 10 	| Millennium Falcon 	| YT-1300 light freighter 	| 3 	|
| 17 	| Imperial shuttle 	| Lambda-class T-4a shuttle 	| 2 	|
| 12 	| X-wing 	| T-65 X-wing 	| 1 	|

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
        

- Algolia\
  [Algolia](https://www.algolia.com/) is an AI-powered search, and it is really fast. Most search queries take from 1 to 20 milliseconds to process.
  In this project, it is being disabled due to its needless right now. However, I discovered the possible potential 
  in the future development. Therefore, I am determined to create the environment for Algolia in advance.
  When necessary, turn on in the configuration, and it can be used immediately. On the production, this feature would be
  enabled to connect with the Algolia service where the data in the database are synchronized with it. 


- Testing
  - Run frontend web-application and backend at the same time
  - Monitor the Redis Server or Caching Server using the following command on Redis CLI
  ```
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
  
  # Algolia (Disabled by default, to enable, goto settings.py)
  ALGOLIA_APPLICATION_ID=APPLICATION_ID
  ALGOLIA_API_KEY=API_KEY
  ALGOLIA_INDEX_PREFIX='Starwars'
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

  ALGOLIA_APPLICATION_ID=APPLICATION_ID
  ALGOLIA_API_KEY=API_KEY
  ALGOLIA_INDEX_PREFIX='Starwars'
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
| Action 	| Method 	|           Endpoint 	            |                                                  Description 	                                                   |
|:---:	|:---:	|:-------------------------------:|:----------------------------------------------------------------------------------------------------------------:|
| Get access token 	| POST 	|         /api/v1/auth/ 	         |                                       **Parameters**: Username, Password 	                                       |
| Get the most piloted ship<br>across all of the residents<br>from the specified planets 	| GET 	| /api/v1/most_piloted_starship 	 | **Parameter**: planet (Delimited using Commas)<br>Example: /api/v1/most_piloted_starship?planet=Sullust,Corellia,Kashyyyk |

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
