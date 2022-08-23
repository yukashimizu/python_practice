# docker compose up -d --build
# docker compose exec python3 bash

# cd src
# python main.py

# exit
# docker stop python3

# docker compose down

FROM python:3.10
USER root

RUN apt-get update
RUN apt-get -y install locales && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9
ENV TERM xterm

COPY requirements.txt /root/

RUN apt-get install -y vim less
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools

RUN pip install -r /root/requirements.txt