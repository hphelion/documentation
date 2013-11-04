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
  echo "##### ${BRANCH} #####"
  BRANCH=$(echo ${BRANCH} | sed -s 's,origin/,,')
  git checkout -b "${BRANCH}" || git checkout -f "${BRANCH}"
  git reset HEAD || true
  git pull origin "${BRANCH}"
  git rebase master
  git push origin "${BRANCH}"
done
exit 0
