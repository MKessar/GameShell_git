#!/usr/bin/env sh

# This file is not required. When it exists, it is used to automatically
# validate the mission. It should end with a succesful `gsh check` command.
# It is sometimes possible to "cheat" by using any hidden data in $GSH_TMP,
# but it is better to do it the "intended" way.
# If you write this file, rename it to auto.sh

git remote add Cair https://plmlab.math.cnrs.fr/gameshell_git/cair_paravel.git
git fetch Cair
git co adding_dark
git co switching_air_earth
git co spell

gsh check

