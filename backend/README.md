# CampusLoop Django REST Backend – Setup Guide

The Flutter starter is included in this ZIP. The Django backend is planned as a separate project.

## Create the backend

```bash
mkdir campusloop_backend
cd campusloop_backend
python -m venv venv
venv\Scripts\activate
pip install django djangorestframework django-cors-headers psycopg[binary]
django-admin startproject config .
python manage.py startapp accounts
python manage.py startapp events
python manage.py startapp planner
python manage.py startapp lost_found
python manage.py startapp community
python manage.py migrate
python manage.py runserver
```

Add `rest_framework`, `corsheaders`, and the created apps to `INSTALLED_APPS`.
Configure CORS for the Flutter development environment and create serializers, views and API URLs for each feature.

Do not put production secrets or database passwords in source control.
