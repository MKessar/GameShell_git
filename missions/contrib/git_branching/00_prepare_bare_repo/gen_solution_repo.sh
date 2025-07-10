export GSH_TMP=$(realpath .)
export GSH_HOME=$(realpath .)
git clone $GSH_TMP/al_jeit_repo ./solution1
cd solution1
. $GSH_TMP/co.sh

git branch spell_init
# 03_mergeFF
git merge adding_light 

# 04_contrib
git checkout -b power
cp $GSH_TMP/../04_contrib/dragon_killer.spell .
git commit -am "magma switched to fire !"
git branch power_marker

# 05_merge
git checkout spell
git merge adding_earth --no-edit
git branch adding_earth_merged

git branch -m power power_marker

# 06_merge_conflict
git merge power
cp $GSH_TMP/../06_merge_conflict/dragon_killer.spell .
git add dragon_killer.spell
git commit -m "conflict solved, fire kept"
git branch conflict_solved

# 09_merge_remote
. $GSH_TMP/add_remote_minas_co.sh
git checkout -b ampli minas/spell
git merge switching_magma_earth --no-edit
git merge adding_moisture --no-edit
git checkout spell
git merge ampli --no-edit
git branch merge_remote

repo=solution1_repo
mkdir -p $GSH_TMP/$repo
cd $GSH_TMP/$repo
git init --bare
echo "ref: refs/heads/spell" > HEAD
cd $OLDPWD
git remote add $repo $GSH_TMP/$repo
git push $repo spell spell_init adding_earth adding_light power_marker adding_earth_merged conflict_solved merge_remote


