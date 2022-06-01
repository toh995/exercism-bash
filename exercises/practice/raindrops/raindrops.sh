#!/usr/bin/env bash

raindrops() {
  local og_number="${1}"
  local ret=""

  if [[ $((og_number % 3)) == 0 ]]; then
    ret+="Pling"
  fi
  if [[ $((og_number % 5)) == 0 ]]; then
    ret+="Plang"
  fi
  if [[ $((og_number % 7)) == 0 ]]; then
    ret+="Plong"
  fi
  if [[ "${ret}" == "" ]]; then
    ret="${og_number}"
  fi

  echo "${ret}"
}
raindrops $@
