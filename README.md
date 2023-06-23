# How to create an ubuntu container

Run `whoami` in a terminal and verify that it returns your username. Then run these commands on the host:

```bash
sudo apt install docker.io # install docker
sudo docker build --build-arg username=$(whoami) -t focal . # build image
./create-container.sh <container name>
./enter-container.sh # after this step, we are inside the container
LM_LICENSE_FILE=~/license.dat ~/lscc/radiant/2022.1/bin/lin64/radiant # launch radiant
```

If `python3 --version` returns python 3.8 (which can cause issues building source code), update the symbolic link with:

```bash
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 2
sudo update-alternatives --config python3
```
