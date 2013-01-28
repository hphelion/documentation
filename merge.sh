#!/bin/bash -e
export TERM=xterm-256color
source "$HOME/.rvm/scripts/rvm"
rvm use ruby-1.9.2@unix_cli

function prep() {
  rm -rf docs.hpcloud.com
  git clone git@git.hpcloud.net:DevExDocs/docs.hpcloud.com.git
  cd docs.hpcloud.com
  git checkout develop
  set -x
  git merge remotes/origin/develop
}

case "${1}" in
master)
  prep
  git checkout master
  git merge remotes/origin/master
  echo git subtree pull -P content/documentation git@git.hpcloud.net:DevExDocs/documentation.git master
  echo git push origin master
  ;;
develop)
  prep
  echo git subtree pull -P content/documentation git@git.hpcloud.net:DevExDocs/documentation.git develop
  echo git push origin develop
  ;;
*)
  echo "Usage: ${0} master|develop"
  exit 1
esac

exit 0
