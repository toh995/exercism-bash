#!/usr/bin/env bash

# check if we were given two inputs
if [[ -z "${1+x}" ]] || [[ -z "${2+x}" ]]; then
  echo "Usage: hamming.sh <string1> <string2>"
  exit 1
fi

# double-check lengths
if [[ "${#1}" != "${#2}" ]]; then
  echo "strands must be of equal length"
  exit 1
fi

# now let's compute!
readonly str1="${1}"
readonly str2="${2}"

declare -i ret=0
declare -i i
declare char1
declare char2

for (( i=0; i<"${#str1}"; i++ )); do
  char1="${str1:$i:1}"
  char2="${str2:$i:1}"

  if [[ "${char1}" != "${char2}" ]]; then
    ret=$((ret+1))
  fi
done

echo "${ret}"
