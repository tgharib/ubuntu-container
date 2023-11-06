#!/usr/bin/env bash
sudo docker build --build-arg username=$(whoami) --build-arg dialoutgid=$(getent group dialout | cut -d: -f3) -t focal .
