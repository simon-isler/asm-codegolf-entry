# ASM Codegolf Dockerfile
#
# Version: 1

FROM ubuntu:14.04
MAINTAINER Josua Schmid <josua.schmid@renuo.ch>

# Install dependencies
RUN apt-get update
RUN apt-get install -y build-essential make nasm python

# Create non-privileged user
RUN useradd -b /home -m -s /bin/bash compass
USER compass

# Clone repository
WORKDIR /home/compass

# Create volume for code
VOLUME /code
