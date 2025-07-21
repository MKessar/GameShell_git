merge_remote() {
  repo=$1
  branch1=$2
  branch2=$3
  # if file created by `gsh check` of previous exercice is here
  if [ -f $GSH_TMP/$repo ]
  then
    git co -b work $repo/spell
    git merge $branch1 --no-edit
    git merge $branch2 --no-edit
    git co spell
    git merge work
    cp $MISSION_DIR/README.md .
    git add README.md 
    git ci --no-edit
  fi
}

merge_remote cair_paravel adding_dark switching_air_earth &> /dev/null
merge_remote hogwarts adding_poison switching_dark_fire &> /dev/null
merge_remote novigrad adding_air switching_water_dark &> /dev/null

# If previous exercice were not done in this session, typically with a `gsh goto`, one is created by default
nb_repo=$(git remote show | wc -l)
if [ $nb_repo -lt 3 ]
then
  echo "Warning: no history found in repos among cair_paravel, hogwards or novigrad you added in a previous exercice. cair_paravel repo has been set by default."
  touch $GSH_TMP/cair_paravel
  merge_remote cair_paravel adding_dark switching_air_earth &> /dev/null
fi

