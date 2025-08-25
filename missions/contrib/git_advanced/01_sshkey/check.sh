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
  
 if [ ! -d "$GSH_HOME/Castle/Portals/TrainingSpell" ]
    then 
      echo " The depository  TrainingSpell doesn't exist"
      return 1
    else
    echo " The depository  TrainingSpell  exist"
    fi

  if [ ! -d $GSH_HOME/Castle/Portals/TrainingSpell/.git ]
    then 
      echo " The depository TrainingSpell is not a git depository"
      return 1
    else
      echo " The depository TrainingSpell is a git depository"
  fi
   
  cd $GSH_HOME/Castle/Portals/TrainingSpell
   
  LANG=en_GB git remote show origin | grep git@


  test=$(echo $?)
          
  if [ $test -eq 0 ]
    then 
      echo " you did not changed to SSH URL"
      return 1
  fi
  
    return 0 
}
_mission_check
