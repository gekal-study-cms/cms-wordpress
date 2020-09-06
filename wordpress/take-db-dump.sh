#!/bin/bash

DATABASE=exampledb

USER=exampleuser
PASSWORD=examplepass

EXCLUDED_TABLES=(
)

IGNORED_TABLES_STRING=''
for TABLE in "${EXCLUDED_TABLES[@]}"
do :
   IGNORED_TABLES_STRING+=" --ignore-table=${DATABASE}.${TABLE}"
done

current_dir=$(dirname "$0")

container_tmp_dir="/tmp/$(date '+%Y-%m-%d-%H-%M')"
docker exec -it cms-wordpress-db sh -c "mkdir -p ${container_tmp_dir}"

echo "structure"
docker exec -it cms-wordpress-db sh -c "mysqldump --default-character-set=utf8mb4 --user=${USER} --password=${PASSWORD} --single-transaction --no-data --routines ${DATABASE} 2> /dev/null > ${container_tmp_dir}/01.wordpress.schema.sql"
docker cp  cms-wordpress-db:${container_tmp_dir}/01.wordpress.schema.sql ${current_dir}/db/initdb/01.wordpress.schema.sql

echo "content"
docker exec -it cms-wordpress-db sh -c "mysqldump --default-character-set=utf8mb4 --user=${USER} --password=${PASSWORD} ${DATABASE} --no-create-info --skip-triggers ${IGNORED_TABLES_STRING} 2> /dev/null > ${container_tmp_dir}/02.wordpress.data.sql"
docker cp  cms-wordpress-db:${container_tmp_dir}/02.wordpress.data.sql ${current_dir}/db/initdb/02.wordpress.data.sql
