#!/usr/bin/env bash

compute_total() {
  # Using the formula for the first n terms of a geometric series
  # https://en.wikipedia.org/wiki/Geometric_series#Closed-form_formula 
  bc <<< "(1 - 2^64) / (1 - 2)"
}

compute_square() {
  declare -ir exponent=$(( "${1}" - 1 ))

  if (( "${exponent}" < 0 )) || (( "${exponent}" > 63 )); then
    echo "Error: invalid input"
    return 1
  fi

  bc <<< "2 ^ ${exponent}"
}


main() {
  if [[ "${1}" == "total" ]]; then
    compute_total "${1}"
  else
    compute_square "${1}"
  fi
}
main "${@}"
