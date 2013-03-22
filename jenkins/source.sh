#!/bin/bash -e
export TERM=xterm-256color
source "$HOME/.rvm/scripts/rvm"
rvm use ruby-1.9.2@docs

SERVERS_DIR=$(pwd)/servers
mkdir -p ${SERVERS_DIR} 2>/dev/null || true
serve() {
  BRANCH=$1
  BRANCH=$(echo ${BRANCH} | sed -s 's,origin/,,')
  if [ "${BRANCH}" == "HEAD" -o "${BRANCH}" == "master" -o "${BRANCH}" == "develop" ]
  then
    echo "No update for ${BRANCH}"
    return
  fi

  cd ${SERVERS_DIR}
  DIR=${SERVERS_DIR}/$(echo ${BRANCH} | sed -e 's,/,_,g')
  echo "###### ${DIR} docs.hpcloud.com repo ######"
  if [ ! -d ${DIR} ]
  then
    rm -rf docs.hpcloud.com
    git clone git@git.hpcloud.net:DevExDocs/docs.hpcloud.com.git
    mv docs.hpcloud.com "${DIR}"
    cd "${DIR}"
    git checkout develop
    git pull origin develop
    mkdir -p content
    cd content
    rm -rf documentation
    echo "###### ${DIR} documenation repo ######"
    git clone git@git.hpcloud.net:DevExDocs/documentation.git
    cd documentation
    git checkout "${BRANCH}"
    git pull origin "${BRANCH}"
  else
    cd "${DIR}"
    git checkout develop >/dev/null 2>/dev/null
    git pull origin develop >/dev/null
    cd content/documentation
    echo "###### ${DIR} documenation repo ######"
    git checkout "${BRANCH}" >/dev/null 2>/dev/null
    git pull origin "${BRANCH}" >/dev/null
  fi
  cd "${DIR}"
  sed -i -e "s/Sign Up Now/${BRANCH}/" _layouts/default.html
  sed -i -e "s/Sign Up Now/${BRANCH}/" _layouts/page.html
  make build
  git checkout _layouts/default.html
  git checkout _layouts/page.html
  touch "${DIR}/active"
}

if [ -n "${1}" ]
then
  echo "##### ${1} #####"
  serve "${1}"
  exit 0
fi

rm -f ${SERVERS_DIR}/*/active
git branch -r | while read BRANCH ROL
do
  serve "${BRANCH}"
done
exit 0
