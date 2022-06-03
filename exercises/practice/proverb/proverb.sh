#!/usr/bin/env bash

main() {
  local ret=""
  local -i i j

  for (( i=2; i <= "${#}"; i++ )); do
    j="$(( i-1 ))"
    ret+="For want of a ${!j} the ${!i} was lost.\n"
  done

  [[ -n "${1}" ]] && \
    ret+="And all for the want of a ${1}."

  echo -e "${ret}"
}

main "${@}"
