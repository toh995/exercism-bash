#!/usr/bin/env bash
main() {
  # filter out some special characters
  local words="${@}"
  words="${words//$(echo *)/ }"
  words="${words//[-_]/ }"

  local ret=""

  for word in ${words}; do
    local uppercased=$(tr "a-z" "A-Z"<<<"${word:0:1}")
    ret+="${uppercased}"
  done

  echo "${ret}"
}
main $@
# echo $@
