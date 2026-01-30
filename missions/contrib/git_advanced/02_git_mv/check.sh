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

  if [ ! -e "$GSH_HOME/Castle/Portals/spellbook/Chapter_1/glowing_finger_spell" ]
  then 
    echo " The file  glowing_finger_spell is not in Chapter_1"
    return 1
  else
    echo " The file  glowing_finger_spell  is in Chapter_1"
  fi

  if [ ! -e "$GSH_HOME/Castle/Portals/spellbook/Chapter_1/truth_spell" ]
  then 
    echo " The file  truth_spell is not in Chapter_1"
    return 1
  else
    echo " The file  truth_spell is in Chapter_1"
  fi


  # verifier que le repertoire existe et est un depot git
  cd $GSH_HOME/Castle/Portals/spellbook/

  # verif que tous les fichiers sont suivis
  LANG=en_GB git status | grep -e "Untracked"

  test=$(echo $?)

  if [ $test -eq 0 ]
  then 
    echo "You should not have untracked file."
    return 1
  fi

  # verif que aucune modif ne traine dans la copie de travail
  LANG=en_GB git status | grep -e "Changes not staged for commit:"

  test=$(echo $?)

  if [ $test -eq 0 ]
  then 
    echo "You still have changes in your working directory. Everything should be committed, no change should remain."
    return 1
  fi



  LANG=en_GB git status | grep -e "up to date with"
  test=$(echo $?)

  if [ $test -eq 1 ]
  then 
    echo " You did not push all of your modifications."
    return 1
  else
    cd $GSH_HOME/Castle/Portals/spellbook/

    LANG=en_GB git status | grep -e "Changes to be committed:"
    test=$(echo $?)

    if [ $test -eq 0 ]
    then 
      echo " You did not commit all of your modifications"
      return 1
    else 
      echo " You did push all of your modifications"
      return 0 
    fi
  fi

}
_mission_check
