cd Castle/Portals/
rm -rf spellbook solution_repo
mkdir spellbook solution_repo
cd solution_repo
git init --bare 

cd ../spellbook
git init --initial-branch=main
git config --local user.name "Jafar"
git config --local user.email "<jafar@aladin.cool>"


echo "Toy repository to learn git with [GameShell_git](https://github.com/MKessar/GameShell_git)" > README.md
git add README.md
git commit -m "initial repo with README" 
git branch init

cp ../glowing_finger_spell .
git add glowing_finger_spell 
git commit -m 'glowing finger spell added' 
git branch glowing_finger_spell_added

cp ../truth_spell .
git add truth_spell
git commit -m "truth spell added" 
git branch truth_spell_added

mkdir Chapter_1
git mv truth_spell glowing_finger_spell Chapter_1/
git commit -m "moving spell into Chapter_1" 
git branch moving_spell_into_Chapter_1

git rm Chapter_1/truth_spell 
git commit -m  "truth spell removed"  
git branch  truth_spell_removed 

git revert HEAD --no-edit
git commit --amend  --no-edit
git branch revert 

cp ../flame_spell .
git checkout -b flame main
git add flame_spell
git commit -m "flame spell added" 
git branch flame_added

cp ../cheater/* .
git co -b cheater main
git add cheater_spell amplifier
git ci -m "cheater spell added" 
git branch cheater_added

git co -b beer main
cp ../beer/* .
git add beer_spell amplifier
git ci -m "beer spell added" 
git branch beer_added

git co main
git merge flame --no-edit
git branch flame_merged

git merge cheater --no-edit 
git branch cheater_merged

git merge beer --no-edit
cp ../amplifier_conflict_fixed ./amplifier
git add amplifier
git ci --no-edit 
git branch beer_merged

git remote add origin ../solution_repo
git push origin main init glowing_finger_spell_added truth_spell_added moving_spell_into_Chapter_1 flame_added cheater_added beer_added flame_merged cheater_merged beer_merged truth_spell_removed revert

cd ..
echo "ref: refs/heads/main" > solution_repo/HEAD
