FROM ubuntu:16.04

LABEL Nick Marshall "marshallnw18@gmail.com"
EXPOSE 5000/tcp

# Setting Flask App env variable for use in the 'flask run' cmd
ENV FLASK_APP /app/flaskblog.py

RUN apt-get update -y && \
    apt-get install -y python-pip python-dev

# Copying requirements.txt to Ubuntu for pip installation
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

# Installing required packages
RUN pip install -r requirements.txt

# Copying local project files to the /app dir on Ubuntu
COPY . /app

# Running flask application 
CMD ["flask", "run", "--host", "0.0.0.0"]
