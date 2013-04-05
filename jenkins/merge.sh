#!/bin/bash
#
# This script merges master to all the branches
#
rm -f ${SERVERS_DIR}/*/active
git branch -r | grep -v origin/HEAD | grep -v origin/develop |
while read BRANCH ROL
do
  echo "##### ${BRANCH} #####"
  BRANCH=$(echo ${BRANCH} | sed -s 's,origin/,,')
  git checkout -b "${BRANCH}" || git checkout -f "${BRANCH}"
  git pull origin "${BRANCH}"
  git merge origin "${BRANCH}" || true
  git push origin "${BRANCH}" || true
done
exit 0
