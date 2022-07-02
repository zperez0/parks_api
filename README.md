# Parks API

#### By _**Z Perez**_

A simple Pokemon themed park finder API.

## Technologies Used
* _Ruby on Rails_
* _rspec_
* _PostgreSQL_
* _faker_

## Description
This application was created to demonstrate my understanding of building out an API using Rails. It contains data for national and state parks. It features serialization, pagination, and versioning. A user can get, post, put, or delete a park.

## Endpoints
| Method | URL | Result |
| :---: | :---: | :---: |
| GET| `localhost:3000/api/v1/parks`  | Returns a list of all of the parks in the database |
| GET| `localhost:3000/api/v2/parks`  | Returns a list of all of the parks in the database |
| GET| `localhost:3000/api/v2/parks?=page1` | Returns 5 parks (V2 only)|
| GET | `localhost:3000/api/v1/parks/:id` | Returns a park with a specific id |
| GET | `localhost:3000/api/v2/parks/21` | Returns a park with a specific id |
| POST | `localhost:3000/api/v1/parks` | Create a park |
| POST | `localhost:3000/api/v2/parks` | Create a park |
| PUT/PATCH | `localhost:3000/api/v1/park/:id` | Update a parks info |
| PUT/PATCH | `localhost:3000/api/v2/park/21` | Update a parks info |
| DELETE | `localhost:3000/api/v1/park/:id` | Delete a park |
| DELETE | `localhost:3000/api/v2/parks/21` | Delete a park |


## Setup/Installation Requirements
* _You will need to install the following before proceeding (click on the link to follow the installation process):_
_[Ruby](https://www.ruby-lang.org/en/documentation/installation/),_
_[PostgreSQL](https://www.postgresql.org/docs/current/tutorial-install.html)_


* _Go to [GitHub](https://github.com/zperez0/parks_api)_
* _Clone git repository to local machine_
* _Navigate to root folder and open directory in your terminal_
* _Install packages (type in the terminal):_
```
bundle install
```
```
bundle exec rails g rspec:install
```
* _Open up postgres (type in the terminal):_
```
postgres
```
* _To shut down postgres:_
```
pg_ctl stop
```

#### Database setup:
* _Open up a new terminal tab_
* _create database (type in terminal):_
```
rake db:create
```
* _To  create migration (type in terminal):_
* _for more inforamation on migrations check out [Rails Guides documentations](https://guides.rubyonrails.org/active_record_migrations.html)_
```
rake db:migrate
```
```
rake db:test:prepare
```
* _seed database with faker gem (type in terminal):_
```
rake db:seed
```

#### Server:
* _Start server (type in terminal):_
```
rails s
```

* _Open up your browser and go to:_
```
http://localhost:3000/
```

#### Test:

* _Run test with rpsec (type in terminal):_
```
rspec
```

## Known Bugs
* _Swagger branch contains Swagger UI; however, it is not working. It is unable to Put/Patch the attribute kind correctly. It throws a 422 error. I recommend using the main branch._

## License
[MIT](https://choosealicense.com/licenses/mit/)

Copyright (c) _2022_, _Z Perez_
