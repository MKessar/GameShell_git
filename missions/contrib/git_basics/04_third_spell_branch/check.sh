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


  expected_name="flame"
  spell_name=${expected_name}_spell

  if [ ! -e "$GSH_HOME/Castle/Portals/spellbook" ]
  then 
    echo " spellbook doesn't exist"
    return 1
  else
    echo " spellbook  exist"
  fi

  if [ ! -e "$GSH_HOME/Castle/Portals/spellbook/$spell_name" ]
  then 
    echo " The file $spell_name doesn't exist"
    return 1
  else
    echo " The file $spell_name exists"
  fi

  # verifier que le repertoire existe et est un depot git
  cd $GSH_HOME/Castle/Portals/spellbook/

  LANG=en_GB git status | grep -e "Untracked"

  test=$(echo $?)

  if [ $test -eq 0 ]
  then 
    echo " you should not have untracked file"
    return 1
  fi

  branch_created=$(git branch | grep $expected_name)
  if [ "$branch_created" = "" ]
  then
    echo "Branch $expected_name is not available..."
    return 1
  fi

  current_branch=$(git branch --show-current)
  if [ "$current_branch" != $expected_name ]
  then
    echo "You are not on the $expected_name branch..."
    return 1
  fi

  main_id=$(git rev-parse main)
  target_id=$(git rev-parse $expected_name)
  if [ "$main_id" = "$target_id" ]
  then
    echo "You did not commit anything, main and $expected_name branches are pointing on the same commit..."
    return 1
  fi

  spell=$(git ls-tree flame $spell_name)

  if [ "$spell" = "" ]
  then
    echo "Spell $spell_name not in repository, at least not on $expected_name branch..."
    return 1
  fi

  return 0

}
_mission_check
