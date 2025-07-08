sorcerer1="Merwyn Ril' Avalon <merwyn@sorcerer2.book>"
sorcerer2="Ewilan Gil' Sayan <ewilan@ewilan.book>"
repo=al_jeit
spell=dragon_killer.spell
mkdir ${repo}
cd ${repo}
git init --initial-branch=spell
cp ../${repo}_files/README.md  ../${repo}_files/LICENSE ../${repo}_files/${spell} .
git add *
git commit -m "Initial dragon killer spell" --author="$sorcerer1"

version="changing_proportion"
cp ../${repo}_files/${spell}_${version}1 ./${spell}
git commit -am "$(echo $version | sed -e "s/_/ /g")" --author="$sorcerer1"

version="adding_earth"
git checkout -b $version
cp ../${repo}_files/${spell}_${version} ./${spell}
git commit -am "$(echo $version | sed -e "s/_/ /g")" --author="$sorcerer1"

version="changing_proportion"
git checkout spell 
cp ../${repo}_files/${spell}_${version}2 ./${spell}
git commit -am "$(echo $version | sed -e "s/_/ /g")" --author="$sorcerer1"

version="adding_light"
git checkout -b $version
cp ../${repo}_files/${spell}_${version} ./${spell}
git commit -am "$(echo $version | sed -e "s/_/ /g")" --author="$sorcerer2"

mkdir ../${repo}_repo
cd ../${repo}_repo
git init --bare
echo "ref: refs/heads/spell" > HEAD

cd $OLDPWD
git remote add ${repo} ../${repo}_repo
git push ${repo} spell adding_earth adding_light

cd ..


sorcerer1="Gandalf <gandalf@lordsoftherings.book>"
sorcerer2="Saroumane <saroumane@lordsoftherings.book>"
repo=minas_tirith
spell=amplification.spell

git clone al_jeit_repo ./${repo}
cd ${repo}
git checkout spell

cp ../${repo}_files/${spell} .
git add *
git commit -m "Initial amplification spell" --author="$sorcerer1"

version="changing_proportion"
cp ../${repo}_files/${spell}_${version}1 ./${spell}
git commit -am "$(echo $version | sed -e "s/_/ /g")" --author="$sorcerer1"

version="switching_magma_earth"
git checkout -b $version
cp ../${repo}_files/${spell}_${version} ./${spell}
git commit -am "$(echo $version | sed -e "s/_/ /g")" --author="$sorcerer1"

version="changing_proportion"
git checkout spell 
cp ../${repo}_files/${spell}_${version}2 ./${spell}
git commit -am "$(echo $version | sed -e "s/_/ /g")" --author="$sorcerer1"

version="adding_moisture"
git checkout -b $version
cp ../${repo}_files/${spell}_${version} ./${spell}
git commit -am "$(echo $version | sed -e "s/_/ /g")" --author="$sorcerer2"

mkdir ../${repo}_repo
cd ../${repo}_repo
git init --bare
echo "ref: refs/heads/spell" > HEAD

cd $OLDPWD
git remote add ${repo} ../${repo}_repo
git push ${repo} spell switching_magma_earth adding_moisture

cd ..
