# syntax=docker/dockerfile:1
FROM ubuntu:20.04
WORKDIR /ubuntu-container
COPY . .
RUN apt-get update
RUN apt-get -y dist-upgrade
RUN apt-get install -y ansible coreutils # coreutils for tail
RUN ansible-playbook ./playbook.yml
WORKDIR /home/owner
CMD tail -f /dev/null
