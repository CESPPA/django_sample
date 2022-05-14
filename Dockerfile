FROM python:3

# update system, upgrade pip and install pipenv
RUN apt-get update \
    && pip install --upgrade pip \
    && pip install pipenv

# set work dir to app
WORKDIR /app

# copy Pipfile and Pipfile.lock
COPY ./Pipfile .
COPY ./Pipfile.lock .

# install python dependencies
RUN pipenv install --system

# copy source files
COPY . /app

CMD ./manage.py migrate && ./manage.py runserver 0.0.0.0:8000
