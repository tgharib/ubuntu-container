# How to create an ubuntu container

Run `whoami` in a terminal and verify that it returns your username. Then run these commands on the host:

```bash
mkdir ~/scratch/ # directory that will be passed through to containers
sudo apt install docker.io # install docker
./build-image.sh
./create-container.sh <container name>
./enter-container.sh # after this step, we are inside the container
# Install steam deb
sudo apt update
sudo apt install steam-libs-amd64:amd64 steam-libs-i386:i386
```

If you get an error about a missing display, try running `xhost +local:` on the host
