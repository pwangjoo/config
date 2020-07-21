# image
FROM ubuntu:18.04

# create user and workdir
RUN useradd -ms /bin/bash user1
USER user1
WORKDIR /home/user1
