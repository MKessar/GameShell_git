#!/usr/bin/env sh

# This file is not required: it is sourced once when initialising a GameShell
# game, and whenever the corresponding missions is (re)started.
# It typically creates the parts of the mission that will be available during
# the whole game, like the directory structure.
#
# Since it is sourced, it may define environment variables if you really need
# them, but it should "unset" any local variable it has created.

if ! git --version > /dev/null 2 > /dev/null
then  echo "git not found"
  return 1
fi

mkdir -p $GSH_HOME/Castle/Portals/
mkdir -p $GSH_HOME/Castle/Main_tower
cp $MISSION_DIR/PortalBook $GSH_HOME/Castle/Main_tower
cp $MISSION_DIR/clean.sh $GSH_TMP
cp $MISSION_DIR/clone.sh $GSH_TMP
cp $MISSION_DIR/co.sh $GSH_TMP
cp $MISSION_DIR/remove_marker_branch_repo.sh $GSH_TMP
cp $MISSION_DIR/add_remote_minas_co.sh $GSH_TMP
cp $MISSION_DIR/add_remote_myfork.sh $GSH_TMP
cp $MISSION_DIR/add_remote_final_exo.sh $GSH_TMP
cp $MISSION_DIR/merge_remote.sh $GSH_TMP


cp -r $MISSION_DIR/solution1_repo $GSH_TMP
cp -r $MISSION_DIR/minas_tirith_repo $GSH_TMP/minas_tirith
cp -r $MISSION_DIR/cair_paravel_repo $GSH_TMP
cp -r $MISSION_DIR/hogwarts_repo $GSH_TMP
cp -r $MISSION_DIR/novigrad_repo $GSH_TMP
