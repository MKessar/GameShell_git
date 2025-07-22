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
comment_str=$3
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
    echo $comment_str
    ;;
esac
}

check_answer_branch() {
read -r response
case "$response" in
  "" | *[!0-9]*)
    echo "That's not even a number!"
    return 1
    ;;
  *)
    if [ "$response" = 1 ]
    then
      echo "Wrong, this would create the branch work on HEAD, so probably where the spell branch is."
      return 1
    elif [ "$response" = 2 ]
    then
      echo "Wrong, this would create the branch work at the right place but your HEAD will not point at it, a checkout is missing."
      return 1
    elif [ "$response" = 3 ]
    then
      echo "Correct ! This would create the branch work at the right place and your HEAD will point at it. Answers 5 and 6 does the same as well"
      echo ""
      return 0
    elif [ "$response" = 4 ]
    then
      echo "Wrong, your HEAD will point at the right commit, but in detached mode, the work branch is missing here."
      return 1
    elif [ "$response" = 5 ]
    then
      echo "Correct ! This would create the branch work at the right place and your HEAD will point at it. Answers 3 and 6 does the same as well"
      echo ""
      return 0
    elif [ "$response" = 6 ]
    then
      echo "Correct ! This would create the branch work at the right place and your HEAD will point at it. Answers 3 and 5 does the same as well"
      echo ""
      return 0
    fi
    echo $comment_str
    ;;
esac
}

_mission_check() {

  goal=$GSH_HOME/Castle/Portals/al_jeit
  current="$PWD"

  if [ "$goal" != "$current" ] 
    then 
      echo "You are not in the Al Jeit portal"
      return 1
  fi

  current_branch=$(git branch --show-current)
  if [ "$current_branch" != "spell" ]
    then
        echo "You are not on the spell branch..."
        return 1
  fi


echo "What does the contribution of this repository bring to our spell ?"
echo "1. a new spell in the form of a .spell file"
echo "2. a modification of the README.md file"
echo "3. a modified version of the dragon_killer.spell"
echo "4. both a new spell in the form of a .spell file and a modification of the README.md file"
res="4"
err_str="Too bad! The answer was $res. Look at the difference with \`git diff\` between any revision of the repositpry and the spell branch, it will appear."
check_answer "$res" "$err_str"
if [ $? = "1" ] ; then return 1 ; fi

echo "How would you create that branch and make your HEAD point at it ? (Let us assume you are working on the hogwarts repository)"
echo "1. git checkout -b work"
echo "2. git branch work hogwarts/spell"
echo "3. git branch work hogwarts/spell ; git checkout work"
echo "4. git checkout hogwarts/spell"
echo "5. git checkout -b work hogwarts/spell"
echo "6. git checkout hogwarts/spell ; git branch work ; git checkout work"

check_answer_branch 
if [ $? = "1" ] ; then return 1 ; fi
  
echo "Once this \`work\` branch is set up the idea is to merge all contributions of the repository into it. Do you expect any conflict here ?"
echo "1. no"
echo "2. yes on the README.md file"
echo "3. yes on the dragon_killer.spell file"
echo "4. yes on the LICENSE file"
res="1"
err_str="Too bad! The answer was $res. Look at the difference with \`git diff\` between any revision of the repository, it will appear that the different commits never touch the same line when is history has diverged."
check_answer "$res" "$err_str"
if [ $? = "1" ] ; then return 1 ; fi


echo "Once this \`work\` branch contains all contributions of the repository, the idea is to merge it into our \`spell\` branch. Do you expect any conflict here ? As it is hard to foresee it from here, just answer the question looking at what would happen if any of the three contributions would be merged into \`spell\`"
echo "1. no"
echo "2. yes on the README.md file"
echo "3. yes on the dragon_killer.spell file"
echo "4. yes on the LICENSE file"
res="2"
err_str="Too bad! The answer was $res. Look at the difference with \`git diff\` between any revision of the repository, it will appear that the different commits never touch the same line when is history has diverged."
check_answer "$res" "$err_str"
if [ $? = "1" ] ; then return 1 ; fi

}
_mission_check
