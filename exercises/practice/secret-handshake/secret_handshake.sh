#!/usr/bin/env bash

reverse_array_in_place() {
  local -n arr="${1}" # store a reference to the original array
  local -ir len="${2}"
  local -i i
  local tmp

  for (( i=0; i < ("${len}"/2); i++ )); do
    tmp="${arr[i]}"
    arr[i]="${arr[-1-i]}"
    arr[-1-i]="${tmp}"
  done
}

main() {
  local -ir binary="$(bc <<< "obase=2;${1}")"
  local -a instructions=()
  local -i instruction_len=0
  local ret=""

  # build the instructions array
  (( "${#binary}" >= 1 )) && (( "${binary: -1:1}" == 1 )) && \
    instructions+=("wink") && \
    let instruction_len+=1
  (( "${#binary}" >= 2 )) && (( "${binary: -2:1}" == 1 )) && \
    instructions+=("double blink") && \
    let instruction_len+=1
  (( "${#binary}" >= 3 )) && (( "${binary: -3:1}" == 1 )) && \
    instructions+=("close your eyes") && \
    let instruction_len+=1
  (( "${#binary}" >= 4 )) && (( "${binary: -4:1}" == 1 )) && \
    instructions+=("jump") && \
    let instruction_len+=1
  (( "${#binary}" >= 5 )) && (("${binary: -5:1}" == 1 )) && \
    reverse_array_in_place instructions instruction_len

  # serialize the instructions for output
  for instruction in "${instructions[@]}"; do
    ret+="${instruction},"
  done

  (( "${#ret}" > 0 )) && \
    ret="${ret:0:-1}" # remove the final trailing comma

  echo "${ret}"
}
main "${@}"
