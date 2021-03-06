#!/usr/bin/env bash

set -e

METRICS="$@"

: ${HOST_UID:?"HOST_UID has to be set"}

DB_FILE="/app/repo/metrixpp.db"
CSV_FILE="/app/repo/metrixpp.csv"

fix_permissions() {
    rv=$?
    chown -R ${HOST_UID} ${DB_FILE} ${CSV_FILE}
    exit ${rv}
}
trap fix_permissions INT TERM EXIT

REPO="/app/repo"
METRIX_BIN="/app/metrix++.py"

if [ ! -e ${REPO} ]; then
    echo Repo not found in ${REPO}
    exit -1
fi

cd ${REPO}

python ${METRIX_BIN} collect ${METRICS}

python ${METRIX_BIN} export --db-file=${DB_FILE} > ${CSV_FILE}