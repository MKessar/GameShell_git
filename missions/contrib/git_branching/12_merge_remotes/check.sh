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

check_branches() {
  repo=$1
  branch1=$2
  branch2=$3
  if [ -f $GSH_TMP/$repo ]
  then
    branch=$branch1
    log=$(git branch spell --contains $branch)
    if [ "$log" = "" ]
    then
      echo "$branch branch is not merged into spell..."
      return 1
    fi
    branch=$branch2
    log=$(git branch spell --contains $branch)
    if [ "$log" = "" ]
    then
      echo "$branch branch is not merged into spell..."
      return 1
    fi
  fi
}


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

  check_branches cair_paravel adding_dark switching_air_earth
  if [ $? = "1" ] ; then return 1 ; fi

  check_branches hogwarts adding_poison switching_dark_fire
  if [ $? = "1" ] ; then return 1 ; fi

  check_branches novigrad adding_air switching_water_dark
  if [ $? = "1" ] ; then return 1 ; fi

  uptodate=$(git remote show myfork | grep "spell pushes to spell" | grep "up-to-date")
  if [ "$uptodate" = "" ]
    then
        echo "Branch spell has not been pushed to the forked repository..."
        return 1
  fi

  return 0

}
_mission_check
