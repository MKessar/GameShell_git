#!/usr/bin/env sh

# This file is not required. When it exists, it is used to automatically
# validate the mission. It should end with a succesful `gsh check` command.
# It is sometimes possible to "cheat" by using any hidden data in $GSH_TMP,
# but it is better to do it the "intended" way.
# If you write this file, rename it to auto.sh

git checkout -b ampli minas/spell
git merge switching_magma_earth
git merge adding_moisture
git checkout spell
git merge ampli

gsh check

