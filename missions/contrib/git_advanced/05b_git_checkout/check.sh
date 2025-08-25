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

 LANG=en_GB git branch | grep -e "tach"
test=$(echo $?)

 if [ $test -eq 1 ]
    then 
      return 0
    else
              echo " You did not checkout the most recent commit"

         return 1
      
    fi
   
}
_mission_check
