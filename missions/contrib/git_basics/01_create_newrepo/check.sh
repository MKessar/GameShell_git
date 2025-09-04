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

  # verifier que le repertoire existe et est un depot git

  if [ ! -d "$GSH_HOME/Castle/Portals/TrainingSpells" ]
  then 
    echo " There is no  TrainingSpells Forlder in Castle/Portals "
    return 1
  else
    echo " The depository  TrainingSpells  exist"
  fi

  if [ ! -d $GSH_HOME/Castle/Portals/TrainingSpells/.git ]
  then 
    echo " The depository  TrainingSpells is not a git depository"
    return 1
  else
    echo " The depository  TrainingSpells is  a git depository "
  fi

  # Store the address of the fork of the user in $GSH_TMP to set it properly in the following init
  cd $GSH_HOME/Castle/Portals/TrainingSpells
  url=$(LANG=GB git remote show origin | grep "Push  URL" | tr -s ' ' | cut -d ' ' -f 4)
  echo $url > $GSH_TMP/origin_url

  # bring the user back in the previous directory
  cd -

  return 0 
}
_mission_check
