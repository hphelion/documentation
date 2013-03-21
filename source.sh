#!/bin/bash -e
export TERM=xterm-256color

SERVERS_DIR=$(pwd)/servers
rm -f ${SERVERS_DIR}/*/active
mkdir -p ${SERVERS_DIR} 2>/dev/null || true
git branch -r | while read BRANCH ROL
do
  BRANCH=$(echo ${BRANCH} | sed -s 's,origin/,,')
  if [ "${BRANCH}" == "HEAD" -o "${BRANCH}" == "master" -o "${BRANCH}" == "develop" ]
  then
    continue
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
  make build
  touch "${DIR}/active"
done
exit 0
