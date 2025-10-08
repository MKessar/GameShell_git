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

check_answer() {
result=$1
error_str=$2
read -r response
case "$response" in
  "" | *[!0-9]*)
    echo "That's not even a number!"
    return 1
    ;;
  *)
    if [ "$response" -ne $result ]
    then
      echo $error_str
      return 1
    fi
    ;;
esac
}

_mission_check() {

  goal=$GSH_HOME/Castle/Portals/spellbook
  current="$PWD"

  if [ "$goal" != "$current" ] 
    then 
      echo "You are not in your spellbook"
      return 1
  fi

  current_branch=$(git branch --show-current)
  if [ "$current_branch" != "main" ]
    then
        echo "You are not on the main branch..."
        return 1
  fi

echo "a. If we merge the cheater branch into the main branch, is it a fast-forward merge or a real merge ?"
echo "1. fast-forward merge"
echo "2. real merge"
res="2"
err_str="Too bad! The answer was $res. The main branch is not a direct ancestor of the cheater branch, the history has forked. So merging cheater into main needs really to merge two different versions."
check_answer "$res" "$err_str"
if [ $? = "1" ] ; then return 1 ; fi

}
_mission_check
