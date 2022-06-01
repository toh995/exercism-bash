#!/usr/bin/env bash

main() {
  local -r year="${1}"

  # perform validations
  if (( "${#}" != 1 )) \
    || ! [[ "${year}" =~ ^[0-9]+$ ]]
  then
    echo "Usage: leap.sh <year>"
    exit 1
  fi

  # check if it's a leap year
  if (( "${year}" % 400 == 0 )); then
    echo "true"
  elif (( "${year}" % 100 == 0 )); then
    echo "false"
  elif (( "${year}" % 4 == 0 )); then
    echo "true"
  else
    echo "false"
  fi
}

main "${@}"
