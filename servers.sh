#!/bin/bash -e
export TERM=xterm-256color
source "$HOME/.rvm/scripts/rvm"
rvm use ruby-1.9.2@docs
SERVERS_DIR=$(pwd)/servers

#
# Next available port
#
echo "4000" >${SERVERS_DIR}/.next_port
cat ${SERVERS_DIR}/.next_port ${SERVERS_DIR}/*/port 2>/dev/null | sort | tail -1 >${SERVERS_DIR}/.next_port
PORT=$(cat ${SERVERS_DIR}/.next_port)
rm -f ${SERVERS_DIR}/.next_port
PORT=$(expr $PORT + 1)

#
# Iterate through branches
#
for DIR
in ${SERVERS_DIR}/*
do
  cd "${SERVERS_DIR}"
  echo "**** ${DIR} ****"
  JEKPID=$(cat ${DIR}/pid 2>/dev/null || echo)
  if [ -f ${DIR}/active ]
  then
    if ! ps -p "${JEKPID}" >/dev/null 2>/dev/null
    then
      cd "${DIR}"
      nohup ejekyll --server ${PORT} --auto >/dev/null 2>/dev/null &
      JEKPID=$!
      echo "${JEKPID}" >${DIR}/pid
      echo "${PORT}" >${DIR}/port
      echo "Jekyll server started PID=${JEKPID} PORT=${PORT}"
      PORT=$(expr $PORT + 1)
    else
      JEKPORT=$(cat ${DIR}/port 2>/dev/null || true)
      echo "Jekyll server already running PID=${JEKPID} PORT=${JEKPORT}"
    fi
  else
    if [ -n "${JEKPID}" ]
    then
      echo "Killing old jekyll server ${JEKPID}"
      kill -9 ${JEKPID} || true
    fi
    echo "Removing old branch ${DIR}"
    rm -rf ${DIR}
  fi
done
exit 0
