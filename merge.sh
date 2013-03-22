#!/bin/bash -e
#
# This script is used by Jenkins to merge the latest documentation repo changes into the docs.hpcloud.com repo
#
export TERM=xterm-256color
source "$HOME/.rvm/scripts/rvm"
rvm use ruby-1.9.2@docs

function prep() {
  rm -rf docs.hpcloud.com
  git clone git@git.hpcloud.net:DevExDocs/docs.hpcloud.com.git
  cd docs.hpcloud.com
  git checkout develop
  set -x
  git pull origin develop
}

case "${1}" in
master)
  prep
  git checkout master
  git pull origin master
  git subtree pull -P content/documentation git@git.hpcloud.net:DevExDocs/documentation.git master
  git push origin master
  ;;
develop)
  prep
  git subtree pull -P content/documentation git@git.hpcloud.net:DevExDocs/documentation.git develop
  git push origin develop
  ;;
*)
  echo "Usage: ${0} master|develop"
  exit 1
esac

exit 0
