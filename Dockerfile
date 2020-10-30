FROM python:3.6-alpine

MAINTAINER Nikesh

EXPOSE 8000

RUN apk add --no-cache gcc python3-dev musl-dev

ADD . /django_ec2

WORKDIR /django_ec2

RUN pip3 install -r requirements.txt

RUN python3 hello_world/manage.py makemigrations

RUN python3 hello_world/manage.py migrate

CMD [ "python3", "hello_world/manage.py", "runserver", "0.0.0.0:8000" ]