#!/usr/bin/env sh

# This file is not required. When it exists, it is used to clean the mission,
# for example on completion, or when restarting it.
# In some rare case, cleaning is different after a successful check. You can
# inspect the variable $GSH_LAST_ACTION, which can take the following values:
# assert, check_false, check_true, exit, goto, hard_reset, reset, skip
# If you need this file, rename it to clean.sh

# back to HOM in order to avoid getcwd error

if [ $GSH_LAST_ACTION = check_false ] || [ $GSH_LAST_ACTION = check_true ]  || [ $GSH_LAST_ACTION = exit ] 
then
  touch $GSH_TMP/skip_init
else
  cd $GSH_HOME
  rm -rf $GSH_HOME/Castle/Portals/spellbook
  rm -rf $GSH_TMP/spellbook
  echo "Warning: repository reset, you might have issue when pushing. If yes add --force option when pushing. Jafar will be author of some commits, but it is ok, he knows what he is doing !"
fi
