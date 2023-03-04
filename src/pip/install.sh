#!/bin/bash
set -e

echo "Installing APT Packages"

echo ${PACKAGES}

IFS="," read -a PACKAGES1 <<< ${PACKAGES} && IFS=" "

echo ${PACKAGES1[@]}

install_packages(){
    pip install $@
}

install_packages ${PACKAGES1[@]}