# syntax=docker/dockerfile:1

FROM python:3.8-slim-buster
WORKDIR /init_db

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
 

COPY . .

RUN python3 -m flask run --host 0.0.0.0 --port 5001
RUN curl http://localhost:5001/create_db
RUN curl http://localhost:5001/shutdown
