#!/usr/bin/env bash

if [[ $# -ne 1 ]]; then
  echo './create-container.sh <container name>'
  exit 1
fi

# 0. Build image: docker build -t myubuntu .
# 1. Run this script

# Pass-through both wayland and x11
sudo docker create --name="$1" \
                   --privileged \
                   -v /home/owner/workdir:/home/owner/workdir \
                   -v /dev:/dev \
                   -v /home/owner/.ssh:/home/owner/.ssh \
                   -e XDG_RUNTIME_DIR=/run/user/1000 \
                   -e WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
                   -v $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:$XDG_RUNTIME_DIR/$WAYLAND_DISPLAY \
                   -e DISPLAY=$DISPLAY \
                   -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
                   --ipc=host \
                   --user=$(id -u):$(id -g) \
                   myubuntu
# 3. Run:
echo "sudo docker start $1"
# 4. Run:
echo "sudo docker exec --user=owner -it $1 /bin/bash"
