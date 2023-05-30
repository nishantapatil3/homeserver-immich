#!/bin/bash

# automatically export all variables
set -a
source .env
set +a

echo "Backing up ${DB_DATABASE_NAME} to ${UPLOAD_LOCATION}/db_dumps"

mkdir -p ${UPLOAD_LOCATION}/db_dumps

docker exec -t immich_postgres pg_dumpall -c -U postgres | gzip > "${UPLOAD_LOCATION}/db_dumps/dump.sql.gz"
