#!/usr/bin/env sh

# This file is not required. When it exists, it is used to automatically
# validate the mission. It should end with a succesful `gsh check` command.
# It is sometimes possible to "cheat" by using any hidden data in $GSH_TMP,
# but it is better to do it the "intended" way.
# If you write this file, rename it to auto.sh

cd $GSH_HOME/Castle/Portals/spellbook
cp $GSH_TMP/flame_spell .
git checkout -b flame
git add flame_spell
git commit -m "flame spell added"
gsh check

