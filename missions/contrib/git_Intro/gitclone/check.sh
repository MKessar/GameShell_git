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

  if [ ! -d $GSH_HOME/Castle/Portals/celestial ]
    then 
      echo " The repository  celestial doesn't exist"
      return 1
    else
    echo " The repository  celestial  exist"
    fi

  if [ ! -d $GSH_HOME/Castle/Portals/celestial/.git ]
    then 
      echo " The repository  celestial is not a git depository"
      return 1
    else
    echo " The repository  celestial is  a git depository "
    fi
    
    
    return 0 
}
_mission_check
