#!/usr/bin/env bash

readonly INNER_RADIUS=1 INNER_PTS=10
readonly MIDDLE_RADIUS=5 MIDDLE_PTS=5
readonly OUTER_RADIUS=10 OUTER_PTS=1

is_inner_circle() {
  local -r distance="${1}"
  if [[ "$(bc <<< "${distance} <= ${INNER_RADIUS}")" == "1" ]]; then return 0; else return 1; fi
}
is_middle_circle() {
  local -r distance="${1}"
  if [[ "$(bc <<< "${distance} <= ${MIDDLE_RADIUS}")" == "1" ]]; then return 0; else return 1; fi
}
is_outer_circle() {
  local -r distance="${1}"
  if [[ "$(bc <<< "${distance} <= ${OUTER_RADIUS}")" == "1" ]]; then return 0; else return 1; fi
}

main() {
  local -r x="${1}"
  local -r y="${2}"
  local -r distance="$(bc -l <<< "sqrt( (${x})^2 + (${y})^2 )")"
  local -i ret

  if [[ ! "${x}" =~ ^-{0,1}[0-9.]+$ || ! "${y}" =~ ^-{0,1}[0-9.]+$ ]]; then
    echo "need to supply two numbers"
    exit 1
  fi

  if is_inner_circle "${distance}"; then
    ret="${INNER_PTS}"
  elif is_middle_circle "${distance}"; then
    ret="${MIDDLE_PTS}"
  elif is_outer_circle "${distance}"; then
    ret="${OUTER_PTS}"
  else
    ret=0
  fi

  echo "${ret}"
}
main "${@}"
