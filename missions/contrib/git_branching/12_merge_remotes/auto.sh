#!/usr/bin/env sh

# This file is not required. When it exists, it is used to automatically
# validate the mission. It should end with a succesful `gsh check` command.
# It is sometimes possible to "cheat" by using any hidden data in $GSH_TMP,
# but it is better to do it the "intended" way.
# If you write this file, rename it to auto.sh

merge_remote() {
  repo=$1
  branch1=$2
  branch2=$3
  # if file created by `gsh check` of previous exercice is here
  if [ -f $GSH_TMP/$repo ]
  then
    git co -b work $repo/spell
    git merge $branch1 -m .
    git merge $branch2 -m .
  fi
}

merge_remote cair_paravel adding_dark switching_air_earth
merge_remote hogwarts adding_poison switching_dark_fire
merge_remote novigrad adding_air switching_water_dark

git co spell
git merge work
# Dirty solve of the conflict but who cares, repo will be suppressed right after
git add README.md 
git ci -m .
git push myfork spell --force
