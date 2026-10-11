#!/bin/bash

# Default the TZ environment variable to UTC.
TZ=${TZ:-UTC}
export TZ

# Set environment variable that holds the Internal Docker IP
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

# Switch to the container's working directory
cd /home/container || exit 1

for hook in /entrypoint.d/*.sh; do
    if [ -r "$hook" ]; then
        # shellcheck source=/dev/null
        . "$hook"
    fi
done

PARSED=$(echo "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g')

printf "\033[1m\033[33mcontainer@calagopus~ \033[0m%s\n" "$PARSED"

# Stay alive until the server has handled the stop signal
trap : HUP QUIT ABRT TERM
eval "$PARSED"
