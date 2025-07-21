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
    git merge $branch1 --no-edit
    git merge $branch2 --no-edit
    git co spell
    git merge work 
    cp $MISSION_DIR/README.md .
    git add README.md 
    git ci --no-edit
  fi
}

merge_remote cair_paravel adding_dark switching_air_earth
merge_remote hogwarts adding_poison switching_dark_fire
merge_remote novigrad adding_air switching_water_dark

git push myfork spell --force

gsh check
