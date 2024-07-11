#!/bin/bash
set -e
set +H
shopt -s extglob

echo "Installing Android SDK Tools"
echo "${PACKAGES}"

IFS="," read -a SDKPACKAGES <<< ${PACKAGES} && IFS=" "
echo "List of packages"
echo "${SDKPACKAGES[@]}"

ANDROID_HOME="/opt/android"
PLATFORM_TOOLS="platform-tools-latest-linux"
COMMAND_LINE_TOOLS="cmdline-tools"

PATH_COMMAND_LINE_TOOLS=${ANDROID_HOME}/${COMMAND_LINE_TOOLS}

# Make Directory for Android
mkdir -p ${ANDROID_HOME}

# change directory
cd ${ANDROID_HOME}

# Install Android sdkmanager
curl -L -o ${ANDROID_HOME}/temp.zip "https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip"

# Unzip Android SDKMANAGER
unzip ${ANDROID_HOME}/temp.zip
rm ${ANDROID_HOME}/temp.zip

# Move to proper directory
mkdir ${PATH_COMMAND_LINE_TOOLS}/tools
cd ${PATH_COMMAND_LINE_TOOLS}
mv !(tools) tools
cd ${ANDROID_HOME}

# https://github.com/akhildevelops/devcontainer-features/issues/7
sudo chown -R vscode:vscode ${ANDROID_HOME}

# Set Path
export PATH=${PATH_COMMAND_LINE_TOOLS}/tools/bin:$PATH

#Install sdk packages:
for pkg in "${SDKPACKAGES[@]}"; do
    arg_pkg+=("$pkg")
done

echo "${arg_pkg[@]}"

yes | sdkmanager ${arg_pkg[@]}
