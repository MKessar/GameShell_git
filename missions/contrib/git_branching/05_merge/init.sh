#!/usr/bin/env sh

# This file is not required: it is sourced every time the mission is started.
# Since it is sourced every time the mission is restarted, it can generate
# random data to make each run slightly different.
#
# Since it is sourced, it may define environment variables if you really need
# them, but it should "unset" any local variable it has created.
#
# Note however that should the mission be initialized in a subshell, those
# environment variables will disappear! That typically happens a mission is
# checked using process redirection, as in
#   $ SOMETHING | gsh check
# To mitigate the problem, GameShell will display a message asking the player
# to run
#   $ gsh reset
# in that case.
#
# It typically looks like
_mission_init() {

  if [ -f $GSH_TMP/skip_init ]
  then
    rm $GSH_TMP/skip_init
  else
    . $GSH_TMP/clone.sh &> /dev/null 
    . $GSH_TMP/co.sh &> /dev/null
    git reset --hard adding_light &> /dev/null
    git checkout -b power origin/power_marker &> /dev/null
    . $GSH_TMP/remove_marker_branch_repo.sh &> /dev/null
  fi
  
}
_mission_init
