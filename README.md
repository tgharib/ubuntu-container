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
3. Inside the container, run:

```
sudo apt install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get update
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 2
sudo update-alternatives --config python
```
