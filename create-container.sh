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
                   -v /home/"$username"/scratch:/home/"$username"/scratch `# Empty shared directory between host and container` \
                   -v /home/"$username"/.ssh:/home/"$username"/.ssh `# SSH keys passthrough` \
                   -e XDG_RUNTIME_DIR=/run/user/$(id -u) `# Login session passthrough` \
                   --user=$(id -u):$(id -g) `# User passthrough` \
                   -e WAYLAND_DISPLAY=$WAYLAND_DISPLAY `# Wayland passthrough` \
                   -v $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:$XDG_RUNTIME_DIR/$WAYLAND_DISPLAY `# Wayland passthrough` \
                   -e DISPLAY=$DISPLAY `# X11 passthrough` \
                   -v /tmp/.X11-unix:/tmp/.X11-unix:rw `# X11 passthrough` \
                   --ipc=host `# X11 passthrough (MIT-SHM)` \
                   -v /dev:/dev `# Device passthrough` \
                   focal
cat <<EOF > ./enter-container.sh
#!/usr/bin/env bash
xhost +local:
sudo docker start "$container_name"
sudo docker exec --user="$username" -it "$container_name" /bin/bash
EOF
chmod +x ./enter-container.sh
