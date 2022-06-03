#!/usr/bin/env bash

generate_character() {
  local ret=""
  local -ar attributes=(
    "strength"
    "dexterity"
    "intelligence"
    "wisdom"
    "charisma"
    "constitution"
  )
  local -i val
  local -i constitution

  # compute all basic attributes
  for attr in "${attributes[@]}"; do
    val="$(generate_character_attribute)"
    ret+="${attr} ${val}\n"

    [[ "${attr}" == "constitution" ]] \
      && constitution="${val}"
  done

  # compute hitpoints
  ret+="hitpoints $(compute_hitpoints "${constitution}")"

  echo -e "${ret}"
}

generate_character_attribute() {
  echo "$(( ("${RANDOM}" % 15) + 3 ))"
}

compute_hitpoints() {
  local -ir constitution="${1}"
  local -ir modifier="$(compute_constitution_modifier "${constitution}")"
  local -ir hitpoints="$(( 10 + "${modifier}" ))"
  echo "${hitpoints}"
}

compute_constitution_modifier() {
  local -ir constitution="${1}"
  local -ir diff="$(( "${constitution}" - 10 ))"
  local -i ret

  # divide by 2, but also round down
  if (( "${diff}" % 2 != 0 && "${diff}" < 0 )); then
    ret="$(( ("${diff}"/2) - 1 ))"
  else
    ret="$(( ("${diff}"/2) ))"
  fi

  echo "${ret}"
}

main() {
  local -r keyword="${1}"
  local -r constitution="${2}"

  # echo $constitution
  case "${keyword}" in
    modifier)
      echo "$(compute_constitution_modifier "${constitution}")"
      ;;
    generate)
      echo "$(generate_character)"
  esac
}

main "${@}"
