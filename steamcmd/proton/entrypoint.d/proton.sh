#!/bin/bash

# Print Proton version
printf "\033[1m\033[33mcontainer@calagopus~ \033[0mcat /opt/proton/version\n"
cat /opt/proton/version

# Keep the Proton prefix of the app with the server
export STEAM_COMPAT_DATA_PATH="/home/container/.steam/steam/steamapps/compatdata/${SRCDS_APPID:-0}"
mkdir -p "${STEAM_COMPAT_DATA_PATH}"
