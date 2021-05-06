#!/bin/bash

SCRIPTS_PATH=$(dirname "$0")
# shellcheck disable=SC1090,SC1091
source "${SCRIPTS_PATH}/formatting.sh"

echo "${BOLD}Updating apt${NORMAL}"
yes y | apt-get update
yes y | apt-get upgrade

echo "${BOLD}Applying compliance requirements${NORMAL}"
"${SCRIPTS_PATH}"/compliance.sh

echo "${BOLD}Completed${NORMAL}"

rm -- "$0"