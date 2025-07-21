#!/usr/bin/env sh

# This file is required. It is sourced when checking the goal of the mission
# has been achieved.
# It should end with a command returning 0 on success, and something else on
# failure.
# It should "unset" any local variable it has created, and any "global
# variable" that were only used for the mission. (The function _mission_check
# is automatically unset.)
#
# It typically looks like

_mission_check() {

  goal=$GSH_HOME/Castle/Portals/al_jeit
  current="$PWD"

  if [ "$goal" != "$current" ] 
    then 
      echo "You are not in the Al Jeit portal"
      return 1
  fi

  current_branch=$(git branch --show-current)
  if [ "$current_branch" != "spell" ]
    then
        echo "You are not on the spell branch..."
        return 1
  fi

  for f in dragon_killer.spell no_regen.spell poison.spell weaken.spell
  do
    if [ ! -f "$f" ]
    then
      echo "Spell $f not present..."
      return 1
    fi

    d=$(diff $f $MISSION_DIR/$f)
    if [ "$d" != "" ]
    then
      echo "Something went wrong, spell $f is not as expected..."
      diff $f $MISSION_DIR/$f
      return 1
    fi


  done

  return 0

}
_mission_check
