#!/bin/bash

# Print Wine version
printf "\033[1m\033[33mcontainer@calagopus~ \033[0mwine --version\n"
wine --version

# Keep the Wine console output from wrapping early
if [ -t 0 ]; then
    stty columns 250
fi

# Start a virtual display if XVFB is 1
if [ "${XVFB}" == "1" ]; then
    Xvfb :0 -screen 0 "${DISPLAY_WIDTH}x${DISPLAY_HEIGHT}x${DISPLAY_DEPTH}" &
fi

mkdir -p "${WINEPREFIX}"

# Install what WINETRICKS_RUN lists, Wine Gecko and Wine Mono in the versions this Wine expects
for trick in ${WINETRICKS_RUN}; do
    echo "Installing ${trick}"

    case "${trick}" in
        gecko | mono)
            for msi in $(strings -el /opt/wine-*/lib/wine/*/appwiz.cpl | grep -o "wine-${trick}-[0-9.]*-x86[_0-9]*\.msi" | sort -u); do
                version=${msi#"wine-${trick}-"}
                version=${version%%-*}

                if [ ! -f "${WINEPREFIX}/${msi}" ]; then
                    curl -fsSL -o "${WINEPREFIX}/${msi}" "https://dl.winehq.org/wine/wine-${trick}/${version}/${msi}" || rm -f "${WINEPREFIX}/${msi}"
                fi

                wine msiexec /i "${WINEPREFIX}/${msi}" /qn /quiet /norestart
            done
            ;;
        *)
            winetricks -q "${trick}"
            ;;
    esac
done
