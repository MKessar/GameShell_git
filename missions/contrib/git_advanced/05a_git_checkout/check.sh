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


 if [ ! -e "$GSH_HOME/Castle/Portals/spellbook/Chapter_1/truth_spell" ]
    then 
      echo " The file  truth_spell is not in Chapter_1"
      return 1
    fi

     LANG=en_GB git branch | grep -e "tach"

    test=$(echo $?)

 if [ $test -eq 1 ]
    then 
      echo " You did not checkout a previous commit"
      return 1
    else
      return 0 
      
 fi
  



   
}
_mission_check
