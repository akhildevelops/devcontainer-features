#!/bin/bash
set -e

echo "Installing APT Packages"

echo ${PACKAGES}

IFS="," read -a PACKAGES1 <<< ${PACKAGES} && IFS=" "

echo ${PACKAGES1[@]}

# # Make Directory for Android
# mkdir -p ${ANDROID_HOME}

# Checks if packages are installed and installs them if not
check_packages() {
    if ! dpkg -s "$@" > /dev/null 2>&1; then
        apt_get_update
        apt-get -y install --no-install-recommends "$@"
    fi
}

# Install apt
apt_get_update()
{
    if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
        echo "Running apt-get update..."
        apt-get update -y
    fi
}

check_packages ${PACKAGES1[@]}
