#!/bin/ash
apk update
apk add openjdk8-jre xvfb fluxbox x11vnc
apk add build-base libx11-dev libxcursor-dev libxrandr-dev libxinerama-dev libxi-dev mesa-dev
apk add mesa-dri-gallium xvfb-run
apk add virtualgl --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
git clone https://github.com/novnc/noVNC
git clone https://github.com/mindstorm38/portablemc
./noVNC/utils/launch.sh --listen 80 &
Xvfb +extension GLX &
export DISPLAY=:0
fluxbox &
x11vnc -noshm -forever &
yes y | python3 ./portablemc/portablemc.py start -u Player$RANDOM
