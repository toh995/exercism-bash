#!/usr/bin/env bash

hamming() {
  local str1="${1}"
  local str2="${2}"
  local -i ret=0

  # double-check lengths
  if [[ ${#str1} != ${#str2} ]]; then
    echo "The two provided strings have different lengths! Aborting."
    exit 1;
  fi

  for (( i=0; i<"${#str1}"; i++ )); do
    local char1="${str1:$i:1}"
    local char2="${str2:$i:1}"

    if [[ "${char1}" != "${char2}" ]]; then
      ret=$((ret+1))
    fi
  done

  echo "${ret}"
}
hamming $@
