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

sudo apt install at-spi2-core libpangocairo-1.0-0 libcairo2-dev pulseaudio libc6 libjpeg-dev libieee1284-3 libusb-0.1-4 lsb-base libnss3 libice6 libgl1-mesa-glx libsm6 libxt6 libxext6 libxrender1 libxi6 libxft2 libxslt1.1 libxrandr2 libxfixes3 libxdamage1 libxcursor1 libxcomposite1 libxinerama1 libxss1 libxcb-image0 libxcb-keysyms1 libxcb-render-util0 libxcb-xkb1 libxcb-xinput0 libxcb-xinerama0 libxkbcommon0 libxkbcommon-x11-0 libxcb-icccm4 libx11-6 libgl1-mesa-dri qt5-default
LM_LICENSE_FILE=/home/owner/license.dat /home/owner/lscc/radiant/2022.1/bin/lin64/radiant
```
