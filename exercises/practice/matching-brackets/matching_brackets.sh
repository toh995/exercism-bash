#!/usr/bin/env bash

is_beginning_char() {
  local -r char="${1}"

  case "${char}" in
    "[" | "{" | "(")
      return 0
      ;;
    *)
      return 1
  esac
}

is_end_char() {
  local -r char="${1}"

  case "${char}" in
    "]" | "}" | ")")
      return 0
      ;;
    *)
      return 1
  esac
}

chars_match() {
  if [[ "${1}" == "[" && "${2}" == "]" ]] || \
    [[ "${1}" == "{" && "${2}" == "}" ]] || \
    [[ "${1}" == "(" && "${2}" == ")" ]]
  then
    return 0
  else
    return 1
  fi
}

main() {
  local -r input="${1}"
  local -a stack=()
  local ret="true"
  local -i i
  local char
  local old_char

  for (( i=0; i < "${#input}"; i++ )); do
    char="${input:i:1}"

    if is_beginning_char "${char}"; then
      stack+=( "${char}" )
      continue
    elif is_end_char "${char}"; then
      if (( "${#stack[@]}" <= 0 )); then
        ret="false"
        break
      fi

      old_char="${stack[-1]}"
      unset stack[-1]

      if ! (chars_match "${old_char}" "${char}"); then
        ret="false"
        break
      fi
    fi
  done

  (( "${#stack[@]}" > 0 )) && \
    ret="false"

  echo "${ret}"
}
main "${@}"
