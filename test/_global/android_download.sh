#!/bin/bash
set -e

source dev-container-features-test-lib

check "sdkmanager --version"

check "adb --version"

check "avdmanager list target | grep android-33"

reportResults