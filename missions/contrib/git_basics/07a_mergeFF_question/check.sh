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
  if [ "$current_branch" != "beer" ]
    then
        echo "You are not on the beer branch..."
        return 1
  fi

echo "Does the flame spell exist on the main branch ?"
echo "1. yes"
echo "2. no"
res="2"
err_str="Too bad! The answer was $res. The flame spell has been added to the flame branch which contains everything of the main branch plus the flame spell."
check_answer "$res" "$err_str"
if [ $? = "1" ] ; then return 1 ; fi

echo "Does the flame spell exist on the flame branch ?"
echo "1. yes"
echo "2. no"
res="1"
err_str="Too bad! The answer was $res. We have added it on the flame branch."
check_answer "$res" "$err_str"
if [ $? = "1" ] ; then return 1 ; fi

echo "Does the truth spell exist on the main branch ?"
echo "1. yes"
echo "2. no"
res="1"
err_str="Too bad! The answer was $res.i The truth spell exists on both main and flame branches."
check_answer "$res" "$err_str"
if [ $? = "1" ] ; then return 1 ; fi

echo "Does the truth spell exist on the flame branch ?"
echo "1. yes"
echo "2. no"
res="1"
err_str="Too bad! The answer was $res.i The truth spell exists on both main and flame branches."
check_answer "$res" "$err_str"
if [ $? = "1" ] ; then return 1 ; fi

echo "If we merge the flame branch into the main branch, is it a fast-forward merge or a real merge ?"
echo "1. fast-forward merge"
echo "2. real merge"
res="1"
err_str="Too bad! The answer was $res. The main branch is a direct ancestor of the flame branch, the history did not fork. So merging flame into main consists simply in moving the main branch where the flame branch is sitting. It is a fast-forward merge."
check_answer "$res" "$err_str"
if [ $? = "1" ] ; then return 1 ; fi

echo "After the merge will the flame spell appear on the main branch ?"
echo "1. yes"
echo "2. no"
res="1"
err_str="Too bad! The answer was $res. After the merge, the history of the main branch will contain the commit that adds the flame spell into the project, so the file will appear."
check_answer "$res" "$err_str"
if [ $? = "1" ] ; then return 1 ; fi

}
_mission_check
