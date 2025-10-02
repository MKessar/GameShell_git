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
cd $GSH_HOME/Castle/Portals/spellbook
  
git config user.email > /dev/null
  
if [ $? -eq 1 ]
then
  echo " There is no user.email defined locally or globaly for git"
  return 1
else
  echo " user.email is defined"
fi

          
git config user.name > /dev/null
if [ $? -eq 1 ]
then 
  echo " There is no user.name defined locally or globaly for git"
  return 1
else
  echo " user.name is defined"
fi

cp .git/config $GSH_TMP/gitconfig
    
return 0 
}
_mission_check
