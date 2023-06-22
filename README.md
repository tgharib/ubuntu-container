# Container creation steps

0. `sudo apt install docker.io`
1. Build image: `sudo docker build -t focal .`
2. `./create-container.sh <container name>`
3. Inside the container, run:

```
sudo apt install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get update
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 2
sudo update-alternatives --config python

sudo apt install at-spi2-core libpangocairo-1.0-0 libcairo2-dev pulseaudio libc6 libjpeg-dev libieee1284-3 libusb-0.1-4 lsb-base libnss3 libice6 libgl1-mesa-glx libsm6 libxt6 libxext6 libxrender1 libxi6 libxft2 libxslt1.1 libxrandr2 libxfixes3 libxdamage1 libxcursor1 libxcomposite1 libxinerama1 libxss1 libxcb-image0 libxcb-keysyms1 libxcb-render-util0 libxcb-xkb1 libxcb-xinput0 libxcb-xinerama0 libxkbcommon0 libxkbcommon-x11-0 libxcb-icccm4 libx11-6 libgl1-mesa-dri qt5-default
LM_LICENSE_FILE=/home/nates/license.dat /home/nates/lscc/radiant/2022.1/bin/lin64/radiant
```
