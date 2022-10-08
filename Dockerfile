# FROM python:3
# ENV API_ENV 1
# RUN mkdir /code
# WORKDIR /Users/admin/Desktop/API_ENV/farmapp
# COPY requirements.txt /code/
# RUN pip install -r requirements.txt
# RUN pip install --upgrade pip
# COPY . /Users/admin/Desktop/API_ENV/farmapp/



# — — — — — Dockerfile
# We Use an official Python runtime as a parent image
FROM python:3.7
# The enviroment variable ensures that the python output is set straight
# to the terminal with out buffering it first
ENV PYTHONUNBUFFERED 1
# create root directory for our project in the container
RUN mkdir /farmapp
# Set the working directory to /music_service
WORKDIR /farmapp
# Copy the current directory contents into the container at /music_service
ADD . /farmapp/
# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt
# RUN pip install --upgrade pip
EXPOSE 8000
CMD exec gunicorn farmapp.wsgi:application — bind 0.0.0.0:8000
