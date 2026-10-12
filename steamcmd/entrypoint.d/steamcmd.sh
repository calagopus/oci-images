#!/bin/bash

# Update the server with SteamCMD if AUTO_UPDATE is 1 or not set
if [ -z "${AUTO_UPDATE}" ] || [ "${AUTO_UPDATE}" == "1" ]; then
    if [ -n "${SRCDS_APPID}" ]; then
        if [ -z "${STEAM_USER}" ]; then
            STEAM_USER=anonymous
            STEAM_PASS=""
            STEAM_AUTH=""
        fi

        # shellcheck disable=SC2046,SC2086
        ./steamcmd/steamcmd.sh +force_install_dir /home/container +login ${STEAM_USER} ${STEAM_PASS} ${STEAM_AUTH} $( [[ "${WINDOWS_INSTALL}" == "1" ]] && printf %s '+@sSteamCmdForcePlatformType windows' ) +app_update 1007 +app_update ${SRCDS_APPID} $( [[ -z ${SRCDS_BETAID} ]] || printf %s "-beta ${SRCDS_BETAID}" ) $( [[ -z ${SRCDS_BETAPASS} ]] || printf %s "-betapassword ${SRCDS_BETAPASS}" ) $( [[ -z ${HLDS_GAME} ]] || printf %s "+app_set_config 90 mod ${HLDS_GAME}" ) ${INSTALL_FLAGS} $( [[ "${VALIDATE}" == "1" ]] && printf %s 'validate' ) +quit
    else
        echo "No app id set, skipping the update."
    fi
else
    echo "Auto update is disabled, skipping the update."
fi
