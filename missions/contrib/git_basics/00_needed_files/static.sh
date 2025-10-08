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
mkdir -p $GSH_HOME/Castle/Main_building/Library

cp $MISSION_DIR/truth_spell $GSH_HOME/Castle/Main_building/Library/
cp $MISSION_DIR/glowing_finger_spell $GSH_HOME/Castle/Main_building/Library/
cp $MISSION_DIR/flame_spell $GSH_HOME/Castle/Main_building/Library/
cp -r $MISSION_DIR/cheater $GSH_HOME/Castle/Main_building/Library/
cp -r $MISSION_DIR/beer $GSH_HOME/Castle/Main_building/Library/

cp $MISSION_DIR/truth_spell $GSH_TMP
cp $MISSION_DIR/glowing_finger_spell $GSH_TMP
cp $MISSION_DIR/flame_spell $GSH_TMP
cp -r $MISSION_DIR/cheater $GSH_TMP
cp -r $MISSION_DIR/beer $GSH_TMP

cp $MISSION_DIR/amplifier_conflict_fixed $GSH_TMP

cp $MISSION_DIR/clone.sh $GSH_TMP
cp $MISSION_DIR/clean.sh $GSH_TMP
cp $MISSION_DIR/add_remote_origin.sh $GSH_TMP
cp $MISSION_DIR/remove_init_branches.sh $GSH_TMP
cp -r $MISSION_DIR/solution_repo $GSH_TMP

