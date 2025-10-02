#!/usr/bin/env sh

# This file is not required. When it exists, it is used to automatically
# validate the mission. It should end with a succesful `gsh check` command.
# It is sometimes possible to "cheat" by using any hidden data in $GSH_TMP,
# but it is better to do it the "intended" way.
# If you write this file, rename it to auto.sh

cd $GSH_HOME/Castle/Portals/spellbook
# recreate properly main branch on the remote before doing the commit otherwise status does not show the correct message
git push -u origin main
git commit -m 'glowing finger spell added'
gsh check
