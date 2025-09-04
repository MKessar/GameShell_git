#!/usr/bin/env sh

# This file is not required. When it exists, it is used to automatically
# validate the mission. It should end with a succesful `gsh check` command.
# It is sometimes possible to "cheat" by using any hidden data in $GSH_TMP,
# but it is better to do it the "intended" way.
# If you write this file, rename it to auto.sh

url=$(LANG=GB git remote show origin | grep "Push  URL" | tr -s ' ' | cut -d ' ' -f 4)
git remote set-url origin git@plmlab.math.cnrs.fr:gameshell_git/al_jeit.git
gsh check
# Put URL back in case we are working on a local remote
git remote set-url origin $url
