#!/usr/bin/env bash

readonly -A COLOR_DICT=(
  [black]=0
  [brown]=1
  [red]=2
  [orange]=3
  [yellow]=4
  [green]=5
  [blue]=6
  [violet]=7
  [grey]=8
  [white]=9
)


main() {
  local -r color1="${1}"
  local -r color2="${2}"
  if [[ -z "${color1}" || -z "${color2}" ]]; then
    echo "invalid color"
    exit 1
  fi

  local -ir val1="${COLOR_DICT["${color1}"]}"
  local -ir val2="${COLOR_DICT["${color2}"]}"

  if [[ "${val1}" == 0 ]]; then
    echo "${val2}"
  else
    echo "${val1}${val2}"
  fi
}
main "${@}"
