#!/bin/bash

set -eo pipefail

function removeResources {
  local COUNT=0
  echo "Checking resources defined in ${BOLD}${1}${NORMAL}"
  while IFS="" read -r RESOURCE || [ -n "${RESOURCE}" ]
  do
    if [[ -f "${RESOURCE}" ]]; then
      echo -e "${2} ${BOLD}${RESOURCE}${NORMAL} found. ${GREEN}Removing...${NC}"
      rm -fR "${RESOURCE}"
      ((COUNT=COUNT+1))
    fi
  done < "${1}"
  echo "${BOLD}${COUNT}${NORMAL} problems found and removed"
}
echo "Running ${BOLD}compliance${NORMAL} script"

SCRIPTS_PATH=$(dirname "$0")

# shellcheck disable=SC1090,SC1091
source "${SCRIPTS_PATH}/formatting.sh"

COMPLIANCE_PATH="${SCRIPTS_PATH}/compliance"

removeResources "${COMPLIANCE_PATH}/prohibited.txt" "${RED}Problem!${NC}"
removeResources "${COMPLIANCE_PATH}/warnings.txt" "${YELLOW}Warning!${NC}"

echo "${BOLD}Compliance${NORMAL} script completed"
