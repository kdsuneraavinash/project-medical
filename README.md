# Project Medical

## Description

This application is a simple mobile application which enables users to get information about symptoms of a disease, medicine recommended for curing the disease and list of medical shops where user can get the medicines.

Simple UI helps User to find the information required.

More information about the disease, symptoms and medical shops can be added by simply adding entries in the Database.

It is a client server application, hence same servlet can be used to serve requests from multiple clients.

We have this functionality in two different versions(developed using two different types of technology) as you need.

## Technologies

- Backend - Django
- Frontend - Flutter
- Database - Postgres
- API Documentation (OpenAPI 3.0) - Redoc

## Super user details

- Username - admin
- Password - adminpassword

## Deploying

```bash
$ git push heroku master
Counting objects: 9, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (8/8), done.
Writing objects: 100% (9/9), 4.56 KiB | 2.28 MiB/s, done.
Total 9 (delta 4), reused 0 (delta 0)
remote: Compressing source files... done.
remote: Building source:
remote:
remote: -----> Python app detected
remote: -----> Installing requirements with pip
remote:
remote: -----> Discovering process types
remote:        Procfile declares types -> web
remote:
remote: -----> Compressing...
remote:        Done: 60.1M
remote: -----> Launching...
remote:        Released v7
remote:        https://project-medical.herokuapp.com/ deployed to Heroku
remote:
remote: Verifying deploy... done.
To https://git.heroku.com/project-medical.git
   f57d077..fcf55d9  master -> master
$ heroku run bash
Running bash on ⬢ project-medical... up, run.4130 (Free)
~ $ python manage.py collectstatic

```
