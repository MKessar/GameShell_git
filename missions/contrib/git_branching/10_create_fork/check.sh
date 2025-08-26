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

  expected_name="myfork"
  remote=$(LANG=GB git remote show | grep $expected_name)
  if [ "$remote" = "" ]
    then
        echo "Remote $expected_name does not exist..."
        return 1
  fi

  uptodate=$(LANG=GB git remote show myfork | grep "spell pushes to spell" | grep "up-to-date")
  if [ "$uptodate" = "" ]
    then
        echo "Branch spell has not been pushed to the forked repository..."
        return 1
  fi

  # Store the address of the fork of the user in $GSH_TMP to set it properly in the following init
  url=$(LANG=GB git remote show myfork | grep "Push  URL" | tr -s ' ' | cut -d ' ' -f 4)
  echo $url > $GSH_TMP/fork_url


  return 0

}
_mission_check
