#!/bin/bash
#
# This script merges master to all the branches
#
rm -f ${SERVERS_DIR}/*/active
git config --global push.default matching
git branch -r | grep -v origin/HEAD | grep -v origin/develop | grep -v origin/master |
while read BRANCH ROL
do
  BRANCH=$(echo ${BRANCH} | sed -s 's,origin/,,')
  echo "##### ${BRANCH} #####"
  git checkout -t "origin/${BRANCH}" 2>/dev/null || git checkout -f "${BRANCH}"
  git reset HEAD || true
  git pull
  git rebase master || true
  git push origin || true
done
exit 0
