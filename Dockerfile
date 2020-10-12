FROM python:3.6-alpine

MAINTAINER Nikesh

EXPOSE 8000

RUN apk add --no-cache gcc python3-dev musl-dev

ADD . /django_ec2

WORKDIR /django_ec2

RUN pip3 install -r requirements.txt

RUN python3 django_ec2_project/manage.py makemigrations

RUN python3 django_ec2_project/manage.py migrate

CMD [ "python3", "django_ec2_project/manage.py", "runserver", "0.0.0.0:8000" ]