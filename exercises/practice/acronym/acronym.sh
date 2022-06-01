#!/usr/bin/env bash
main() {
  local -ar words=$@
  local ret=""

  for word in ${words}; do
    ret+="${word:0:1}"
  done

  echo "${ret}"
}
main $@
