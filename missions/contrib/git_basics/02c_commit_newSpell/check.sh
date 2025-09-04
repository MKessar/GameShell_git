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

  if [ ! -e "$GSH_HOME/Castle/Portals/TrainingSpells/glowing_finger_spell" ]
  then 
    echo " The file  glowing_finger_spell doesn't exist"
    return 1
  else
    echo " The file  glowing_finger_spell  exist"
  fi
  cd $GSH_HOME/Castle/Portals/TrainingSpells/

  LANG=en_GB git status | grep -e "Changes to be committed:"

  if [ $? -eq 0 ]
  then 
    echo " you should not have changes to commit any more"
    return 1
  fi


  LANG=en_GB git status | grep -e "Your branch is ahead of"

  if [ $? -eq 1 ]
  then
    echo " you should have changes to push"
    return 1
  fi

  return 0
   
}
_mission_check
