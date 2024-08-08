FROM ubuntu:22.04

RUN apt-get update && apt-get install -y build-essential make nasm python2

VOLUME /code
WORKDIR /code
