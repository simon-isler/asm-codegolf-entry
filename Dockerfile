FROM ubuntu:24.04

RUN apt-get update && apt-get install -y build-essential make nasm python3

VOLUME /code
WORKDIR /code
