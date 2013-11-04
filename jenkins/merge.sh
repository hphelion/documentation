#!/bin/bash
#
# This script merges master to all the branches
#
git checkout master
git pull

rm -f ${SERVERS_DIR}/*/active
git branch -r | grep -v origin/HEAD | grep -v origin/develop | grep -v origin/master |
while read BRANCH ROL
do
  BRANCH=$(echo ${BRANCH} | sed -s 's,origin/,,')
  echo "##### ${BRANCH} #####"
  git checkout -b "${BRANCH}" || git checkout -f "${BRANCH}"
  git reset HEAD || true
  git pull origin "${BRANCH}" </dev/null
  git rebase master
  git push -f origin "${BRANCH}"
done
exit 0
