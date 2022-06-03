#!/usr/bin/env bash

main() {
  local -ir upper_bound="${1}"
  local -a composites=()
  local -a primes=()

  local -i i factor next_multiple

  # for i in {2.."${upper_bound}"}; do
  for (( i=2; i <= "${upper_bound}"; i++ )); do
    if [[ -z "${composites["${i}"]}" ]]; then
      primes+=( "${i}" )
    fi

    # now check all multiples of $i
    factor="${i}"
    while true; do
      next_multiple="$(("${factor}" * "${i}"))"
      if (( "${next_multiple}" <= "${upper_bound}" )); then
        composites["${next_multiple}"]="true"
        let factor+=1
      else
        break
      fi
    done
  done

  echo "${primes[@]}"
}

main "${@}"
