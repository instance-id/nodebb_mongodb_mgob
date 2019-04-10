#!/usr/bin/env bash

echo "************************************************************"
echo "Begin creating application user and db."
echo "************************************************************"

echo "${NODEBB_MONGO_DB} : ${MONGO_ROOT_USER} : ${MONGO_ROOT_PASS} : ${NODEBB_MONGO_USER} : ${NODEBB_MONGO_PASS} : ${NODEBB_MONGO_DB}"

mongo ${NODEBB_MONGO_DB} \
        --host localhost \
        --port 27017 \
        -u ${MONGO_ROOT_USER} \
        -p ${MONGO_ROOT_PASS} \
        --authenticationDatabase admin \
        --eval "db.createUser({ user: '${NODEBB_MONGO_USER}', pwd: '${NODEBB_MONGO_PASS}', roles:[{ role:'dbOwner', db: '${NODEBB_MONGO_DB}' }, { role: 'clusterMonitor', db: 'admin' }]});"

echo "************************************************************"
echo "End Setting up users and db."
echo "************************************************************"
