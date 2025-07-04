
cd $GSH_HOME/Castle/Portals
git clone $GSH_TMP/al_jeit
cd al_jeit
if [ -f $GSH_TMP/gitconfig ]
then
  git config --local user.name $(cat $GSH_TMP/gitconfig | grep name | cut -d '=' -f2)
  git config --local user.email $(cat $GSH_TMP/gitconfig | grep email | cut -d '=' -f2)
else
  git config --local user.name Jaffar
  git config --local user.email jaffar@aladin.cool
fi
git config --local core.editor nano
git config --local alias.co checkout
git config --local alias.br branch
git config --local alias.ci commit
git config --local alias.st status
git config --local alias.last "log -1 HEAD"
git config --local alias.lo "log --oneline --graph --branches"


git checkout spell
git reset --hard 006e702
git push origin spell --force
