#!/usr/bin/env bash

is_armstrong_number() {
  local -i num="${1}"
  local -i num_length="${#num}"
  local -i compare_val=0
  local -i curr_digit
  local -i i=0

  for ((i=0; i < "${#num}"; i++)); do
    curr_digit="${num:i:1}"
    let compare_val+=$(("${curr_digit}" ** "${#num}"))
  done

  if (( "${compare_val}" == "${num}" )); then
    echo "true"
  else
    echo "false"
  fi

}
is_armstrong_number $@
