cd Castle/Portals/
rm -rf spellbook solution_repo
mkdir spellbook solution_repo
cd solution_repo
git init --bare 

cd ../spellbook
git init --initial-branch=main
echo "Toy repository to learn git with [GameShell_git](https://github.com/MKessar/GameShell_git)" > README.md
git add README.md
git commit -m "initial repo with README" --author="Jafar <jafar@aladin.cool>"
git branch init

cp ../glowing_finger_spell .
git add glowing_finger_spell 
git commit -m 'glowing finger spell added' --author="Jafar <jafar@aladin.cool>"
git branch glowing_finger_spell_added

cp ../truth_spell .
git add truth_spell
git commit -m "truth spell added" --author="Jafar <jafar@aladin.cool>"
git branch truth_spell_added

mkdir Chapter_1
git mv truth_spell glowing_finger_spell Chapter_1/
git commit -m "moving spell into Chapter_1" --author="Jafar <jafar@aladin.cool>"
git branch moving_spell_into_Chapter_1

echo "Glowing finger and Truth spells" >> README.md 
git commit -am "README updated" --author="Jafar <jafar@aladin.cool>"
git branch README_updated

git rm Chapter_1/truth_spell 
git commit -m  "truth spell removed"  --author="Jafar <jafar@aladin.cool>"
git branch  truth_spell_removed 

git revert HEAD --no-edit
git commit --amend --author="Jafar <jafar@aladin.cool>" --no-edit
git branch revert 

git remote add origin ../solution_repo
git push origin main init glowing_finger_spell_added truth_spell_added moving_spell_into_Chapter_1 README_updated truth_spell_removed revert 

cd ..
echo "ref: refs/heads/main" > solution_repo/HEAD
