#!/usr/bin/env bash
sudo docker build --build-arg username=$(whoami) -t focal .
