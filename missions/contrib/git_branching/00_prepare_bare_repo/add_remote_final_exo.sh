
create_remote() {
  repo=$1
  branch1=$2
  branch2=$3
  # if file created by `gsh check` of previous exercice is here
  if [ -f $GSH_TMP/$repo ]
  then
    git remote add $repo $GSH_TMP/${repo}_repo
    git fetch $repo
    git co $branch1
    git co $branch2
    git co spell
    # This file will be used by the check
    touch $GSH_TMP/$repo
  fi
}

create_remote cair_paravel adding_dark switching_air_earth &> /dev/null
create_remote hogwarts adding_poison switching_dark_fire &> /dev/null
create_remote novigrad adding_air switching_water_dark &> /dev/null

# If previous exercice were not done in this session, typically with a `gsh goto`, one is created by default
nb_repo=$(git remote show | wc -l)
if [ $nb_repo -lt 3 ]
then
  echo "Warning: no history found in repos among cair_paravel, hogwards or novigrad you added in a previous exercice. cair_paravel repo has been set by default."
  touch $GSH_TMP/cair_paravel
  create_remote cair_paravel adding_dark switching_air_earth &> /dev/null
fi

