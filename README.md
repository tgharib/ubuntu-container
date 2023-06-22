# Container creation steps

1. Build image: `docker build -t focal .`
2. `./create-container.sh <container name>`

```
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
                   focal
```
