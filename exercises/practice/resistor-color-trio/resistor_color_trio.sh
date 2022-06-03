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

count_trailing_zeros() {
  local -ir num="${1}"
  local -i ret=0
  local -i i

  for (( i=${#num}-1; i >= 0; i-- )); do
    if (( "${num:i:1}" == 0)); then
      let ret+=1
    else
      break
    fi
  done

  echo "${ret}"
}

main() {
  local -r color1="${1}"
  local -r color2="${2}"
  local -r color3="${3}"

  if [[ -z "${color1}" ]] || \
    [[ -z "${color2}" ]] || \
    [[ -z "${color3}" ]] || \
    [[ ! -v "COLOR_DICT[${color1}]" ]] || \
    [[ ! -v "COLOR_DICT[${color2}]" ]] || \
    [[ ! -v "COLOR_DICT[${color3}]" ]]
  then
    echo "invalid color"
    exit 1
  fi

  local -ir val1="${COLOR_DICT["${color1}"]}"
  local -ir val2="${COLOR_DICT["${color2}"]}"
  local -ir val3="${COLOR_DICT["${color3}"]}"

  # build raw_num
  local -i raw_num

  if (( "${val1}" == 0 )); then
    raw_num="${val2}"
  else
    raw_num="${val1}${val2}"
  fi

  raw_num="$(( "${raw_num}" * (10**"${val3}") ))"

  # now compute the final value
  local -ir num_trailing_zeros=$( count_trailing_zeros "${raw_num}" )
  local ret

  if (( num_trailing_zeros >= 9 )); then
    ret="$(( "${raw_num}" / (10**9) )) gigaohms"
  elif (( num_trailing_zeros >= 6 )); then
    ret="$(( "${raw_num}" / (10**6) )) megaohms"
  elif (( num_trailing_zeros >= 3 )); then
    ret="$(( "${raw_num}" / (10**3) )) kiloohms"
  else
    ret="${raw_num} ohms"
  fi

  echo "${ret}"
}
main "${@}"
