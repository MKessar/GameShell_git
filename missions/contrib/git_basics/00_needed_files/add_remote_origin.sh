
# if a proper remote has been set in mission 1, origin_url exists and file contains its address. 
if [ -f $GSH_TMP/origin_url ]
then
  origin_url=$(cat $GSH_TMP/origin_url)
  git remote rm origin &> /dev/null
  git remote add origin $origin_url &> /dev/null
  git push -u origin main --force &> /dev/null
  if [ $? -eq 1 ]
  then
    echo "Error: Could not reset remote repository. Are you sure you have unprotected the main branch ?"
  else
    echo "Info: environment reset, your remote repository has been updated with the predefined environment for this mission"
  fi
else
  echo "Warning: could not retrieve the url of your repository, please add it again"
  echo "git remote rm origin"
  echo "git remote add origin ORIGIN_URL"
  echo "Or do nothing, push will work but you will not see anything evolving on the web interface"
  # Set upstream branch to get the correct message when asking for status => necessary for checks
  git push -u origin main &> /dev/null 
fi
