#!/usr/bin/env bash

is_pangram() {
  local -r input=$(echo "${1}" | tr "A-Z" "a-z") 
  local letter
  local ret="true"

  for letter in {a..z}; do
    if ! [[ "${input}" =~ "${letter}" ]]; then
      ret="false"
      break
    fi
  done

  echo "${ret}"
}
is_pangram "${@}"
