#!/usr/bin/env bash

if [[ $# -ne 1 ]]; then
  echo './create-container.sh <container name>'
  exit 1
fi

sudo docker create --name="$1" \
                   --privileged \
                   -v /home/nates/workdir:/home/nates/workdir \
                   -v /dev:/dev \
                   -v /home/nates/.ssh:/home/nates/.ssh \
                   -e XDG_RUNTIME_DIR=/run/user/1000 \
                   -e WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
                   -v $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:$XDG_RUNTIME_DIR/$WAYLAND_DISPLAY \
                   -e DISPLAY=$DISPLAY \
                   -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
                   --ipc=host \
                   --user=$(id -u):$(id -g) \
                   focal
echo "sudo docker start $1"
echo "sudo docker exec --user=nates -it $1 /bin/bash"
