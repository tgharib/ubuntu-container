# syntax=docker/dockerfile:1
FROM ubuntu:20.04
ARG username
ARG dialoutgid
WORKDIR /ubuntu-container
COPY . .
RUN apt-get update
RUN apt-get -y dist-upgrade
RUN apt-get install -y ansible coreutils # coreutils for tail
RUN ansible-playbook --extra-vars "username=${username} dialoutgid=${dialoutgid}" ./playbook.yml
WORKDIR /home/${username}
CMD tail -f /dev/null
