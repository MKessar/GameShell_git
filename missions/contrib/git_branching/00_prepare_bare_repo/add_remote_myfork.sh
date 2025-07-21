
# Set again myfork as a remote
if [ -f $GSH_TMP/fork_url ]
then
  fork_url=$(cat $GSH_TMP/fork_url)
  git remote add myfork $fork_url &> /dev/null
else
  echo "Warning: could not retrieve the url of your fork, please add it again"
  echo "git remote add myfork FORK_URL"
  # TODO Remove this line when dev is finished
  git remote add myfork /home/mhaefele/tmp/git/al_jeit
fi
