#!/usr/bin/env bash

is_question() {
  # remove all trailing whitespace from the input
  local -r input="$(echo -e "${1}" | sed -e 's/[[:space:]]*$//')"
  if [[ "${input: -1}" == "?" ]]; then
    return 0
  else
    return 1
  fi
}

is_all_caps() {
  local -r input="${1}"
  # must have at least one capital
  if [[ "${input}" =~ [A-Z] ]] \
    && [[ "${input}" =~ ^[^a-z]*$ ]] # cannot have lowercase
  then 
    return 0
  else
    return 1
  fi
}

is_empty() {
  local -r input="${1}"
  # match empty/unset string
  if [[ -z "${input}" ]] \
    || [[ "${input}" =~ ^[[:space:]]+$ ]] # match \t, \n, \r, etc.
  then
    return 0
  else
    return 1
  fi
}

main() {
  local -r input="${1}"
  if is_question "${input}"; then
    if is_all_caps "${input}"; then
      echo "Calm down, I know what I'm doing!"
    else
      echo "Sure."
    fi
  elif is_all_caps "${input}"; then
    echo "Whoa, chill out!"
  elif is_empty "${input}"; then
    echo "Fine. Be that way!"
  else
    echo "Whatever."
  fi
}
main "${@}"
