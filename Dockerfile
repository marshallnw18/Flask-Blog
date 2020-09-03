FROM python:alpine3.7

LABEL Nick Marshall "marshallnw18@gmail.com"

# Setting Flask App env variable for use in the 'flask run' cmd
ENV FLASK_APP /app/run.py

# Copying local project files and requirements to the /app dir on the Alpine container 
COPY . /app

WORKDIR /app

# Installing required packages
RUN pip install -r requirements.txt

EXPOSE 5000/tcp

# Running flask application 
# CMD ["flask", "run", "--host", "0.0.0.0"]
ENTRYPOINT [ "python" ]
CMD [ "run.py" ]