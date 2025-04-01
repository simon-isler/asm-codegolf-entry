FROM ubuntu:14.04

RUN apt-get update && apt-get install -y build-essential make nasm python gdb

VOLUME /code
WORKDIR /code
