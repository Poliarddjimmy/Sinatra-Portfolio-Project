
# Welcome to Sinatra Portfolio Project

## Introduction

We're going to build a history site for a e-learning, so we're going to need to
create the following database structure:

- We will have three models (and their corresponding tables) `User`, `Cours`, `Modul`.

- A cours `belongs_to` a user and a cours `has_many` modul.
- modul and user have a `many-to-many` relationship, so we'll need a join table.


## Instructions

We will need to build our controllers and views follow the options of the app.

#### Migrations

Write migrations to create the following tables:

**users**

| **id** |   **last_name**  |  **first_name**  | **pseudo** |        **email**        | **password** | **is_a_teacher** |
| :----: | :--------------: | :--------------: | :--------: | :--------------------:  | :----------: | :--------------: |
|   1    |      Poliard     |     Djimmy       |   Jey13    | poliarddjimmy@gmail.com |   23jim0488  |         1        |
|   1    |      Joseph      |     Billy        |   Bil      |     jbilly@gmail.com    |   billy@123  |         0        |

**Cours**

| **id** |    **user_id**   |          **cours_name**        |               **cours_description**                |
| :----: | :--------------: | :----------------------------: | :------------------------------------------------: |
|   1    |         1        |  full-stack-web-development-v6 |  Welcome to Learn! Over the next 800-1000 hours... |

**moduls**

| **id** | **cours_id** |       **modul_title**       |       **modul_description**       |       **modul_content**      |
| :----: | :----------: | :-------------------------: | :-------------------------------: | :--------------------------: |
|   1    |      1       |  Sinatra Portfolio Project  |  For this assessment you'll be... |  What to expect from the ... |

##### Join Tables

Any time you have a `has_many` to `has_many` relationship, you'll need to create
a join table. An example of a `has_many` to `has_many` relationship is modluls
and users. A modul `has_many` user because many people want to learn and a user usually `has_many` modul.

Below is an example of a join table. We called it modul_users.

**modul_users**

| **id** | **modul_id** | **user_id** |
| :----: | :----------: | :---------: |
|   1    |      1       |     2       |

#### Models

Now, use the `has_many`, `belongs_to` and `has_many, :through` macros to set up
the correct associations in your models:

- A cours `belongs_to` a user and a cours `has_many` modul.
- A user `has_many` modul_users and many modul through modul_users.
- A modul `has_many` modul_users and many users through modul_users.
- A modul_users `belongs_to` a user and a modul.
