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

  current_branch=$(LANG=GB git branch --show-current)
  if [ "$current_branch" != "spell" ]
    then
        echo "You are not on the spell branch..."
        return 1
  fi

  branch=adding_moisture
  log=$(LANG=GB git branch --merged | grep $branch)
  if [ "$log" = "" ]
    then
        echo "$branch branch is not merged..."
        return 1
  fi

  branch=switching_magma_earth
  log=$(LANG=GB git branch --merged | grep $branch)
  if [ "$log" = "" ]
    then
        echo "$branch branch is not merged..."
        return 1
  fi

  for spell in dragon_killer.spell amplification.spell
  do
    diff=$(diff $spell $MISSION_DIR/$spell)
    if [ "$diff" != "" ]
    then
      echo "The final $spell is not correct. It should look like this:"
      cat $MISSION_DIR/$spell
      return 1
    fi
  done

  return 0

}
_mission_check
