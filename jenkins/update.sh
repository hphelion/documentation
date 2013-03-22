#!/bin/bash -e
#
# This script generates updates the active branches
#
rm -f ${SERVERS_DIR}/*/active
git branch -r | while read BRANCH ROL
do
  ./jenkins/source.sh "${BRANCH}"
done
exit 0
