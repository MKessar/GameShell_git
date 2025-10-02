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

  LANG=en_GB git status | grep -e "up to date with"
test=$(echo $?)

 if [ $test -eq 1 ]
      then 
      echo " You did not pushed all of your modifications"
      return 1
    else
        LANG=en_GB git status | grep -e "nothing to commit"
        test=$(echo $?)
         if [ $test -eq 1 ]
            then 
               echo " You did not commited all of your modifications"
           return 1
          else 
          
             LANG=en_GB git branch | grep -e "tach"

             if [ $test -eq 0 ]
                then 
                  return 0
                else
                  echo " You did not checkout the most recent commit"
                  return 1
      
            fi
         fi
  fi
   
}
_mission_check
