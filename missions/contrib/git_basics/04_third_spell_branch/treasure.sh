#!/usr/bin/env bash

# Couleurs ANSI
RED='\033[0;31m'
ORANGE='\033[38;5;208m'
YELLOW='\033[1;33m'
RESET='\033[0m'

frames=(
"${RED}             .          ${RESET}\n\
${ORANGE}           .oOo.        ${RESET}\n\
${YELLOW}         .oOOOOOo.      ${RESET}\n\
${RED}       .oOOOOOOOOOo.     ${RESET}\n\
${ORANGE}     .oOOOOOOOOOOOOOo.${RESET}\n\
${YELLOW}    .oOOOOOOOOOOOOOOOo.${RESET}\n\
${RED}   .oOOOOOOOOOOOOOOOOOo.${RESET}\n\
${ORANGE}    .oOOOOOOOOOOOOOOOo.${RESET}\n\
${YELLOW}     .oOOOOOOOOOOOOOo.${RESET}\n\
${RED}      .oOOOOOOOOOOOo.${RESET}\n\
${ORANGE}       .oOOOOOOOOOo.${RESET}\n\
${YELLOW}        .oOOOOOOOo.${RESET}\n\
${RED}         .oOOOOOo.${RESET}\n\
${ORANGE}          .oOOOo.${RESET}\n\
${YELLOW}          .oOOOo.${RESET}\n\
${RED}          .oOOOo.${RESET}\n\
${ORANGE}          .oOOOo.${RESET}\n\
${RED}           .oOo.${RESET}\n\
${RED}                      ${RESET}"
)

while true; do
  for f in "${frames[@]}"; do
    clear
    printf "%b\n" "$f"
    sleep 0.15
  done
done

