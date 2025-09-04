#!/usr/bin/env sh

# This file is not required. When it exists, it is used to automatically
# validate the mission. It should end with a succesful `gsh check` command.
# It is sometimes possible to "cheat" by using any hidden data in $GSH_TMP,
# but it is better to do it the "intended" way.
# If you write this file, rename it to auto.sh

git remote add myfork git@plmlab.math.cnrs.fr:mhaefele/al_jeit.git
git push myfork spell --force
echo "Warning: this auto sets git@plmlab.math.cnrs.fr:mhaefele/al_jeit.git as forked repository. If it fails, sorry you have to do this mission and set up your own fork..."
gsh check

