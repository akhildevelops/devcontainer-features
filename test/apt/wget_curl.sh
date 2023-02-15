#!/bin/bash

set -e

source dev-container-features-test-lib

check "wget --version"

check "curl --version"

reportResults