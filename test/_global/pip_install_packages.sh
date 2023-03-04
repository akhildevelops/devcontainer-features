#!/bin/bash
set -e

source dev-container-features-test-lib

check "jupyter --version"

check "poetry --version"

reportResults