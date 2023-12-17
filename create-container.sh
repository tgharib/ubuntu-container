#!/usr/bin/env bash

if [[ $# -ne 1 ]]; then
  echo './create-container.sh <container name>'
  exit 1
fi

username=$(whoami)
container_name="$1"

mkdir /home/"$username"/scratch

sudo docker create --name="$container_name" \
                   --privileged \
                   -v /home/"$username"/scratch:/home/"$username"/scratch \
                   -v /home/"$username"/.ssh:/home/"$username"/.ssh \
                   -v $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:/tmp/$WAYLAND_DISPLAY \
                   -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
                   -v /dev:/dev \
                   -e XDG_RUNTIME_DIR=/tmp/ \
                   -e WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
                   -e DISPLAY=$DISPLAY \
                   --ipc=host \
                   --net=host \
                   steam
cat <<EOF > ./enter-container.sh
#!/usr/bin/env bash
xhost +local:
sudo docker start "$container_name"
sudo docker exec --user="$username" -it "$container_name" /bin/bash
EOF
chmod +x ./enter-container.sh
