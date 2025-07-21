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
  # remotes_url created just before and containing all created remotes
  # nothing to do if the player is not in charge of the remote given as parameter
  if [ "$(grep $repo $GSH_TMP/remotes_url)" != "" ]
  then
    branch=$branch1
    if [ "$(git branch | grep $branch)" = "" ]
    then
      echo "Branch $branch from repository $repo has not been created..."
      return 1
    fi
    branch=$branch2
    if [ "$(git branch | grep $branch)" = "" ]
    then
      echo "Branch $branch from repository $repo has not been created..."
      return 1
    fi

    # Create a file to be able to initialize next question with correct remotes and branches
    touch $GSH_TMP/$repo
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

  all_remotes=$(git remote show)
  rm -f $GSH_TMP/remotes_url
  touch $GSH_TMP/remotes_url
  for r in $all_remotes 
  do  
    git remote show $r | grep "Push  URL" >> $GSH_TMP/remotes_url
  done
  
  nb_repo=$(wc -l $GSH_TMP/remotes_url | cut -d ' ' -f 1)
  if [ $nb_repo -lt 3 ]
  then
        echo "You did not create a single remote..."
        return 1
  fi

  check_branches cair_paravel adding_dark switching_air_earth
  if [ $? = "1" ] ; then return 1 ; fi

  check_branches hogwarts adding_poison switching_dark_fire
  if [ $? = "1" ] ; then return 1 ; fi

  check_branches novigrad adding_air switching_water_dark
  if [ $? = "1" ] ; then return 1 ; fi

  # Store the address of the fork of the user in $GSH_TMP to set it properly in the following init
  url=$(git remote show myfork | grep "Push  URL" | tr -s ' ' | cut -d ' ' -f 4)
  echo $url > $GSH_TMP/fork_url


  return 0

}
_mission_check
