#!/bin/sh

DB_NAME=$1
DB_FILE=$2

[ -z "$DB_NAME" ] && echo "Usage: pgr DB_NAME [DB_FILE_NAME]" && exit 1;
[ -z "$DB_FILE" ] && DB_FILE="${DB_NAME}db";

FILE_PATH="${HOME}/${DB_FILE}"

echo "DROP current db at $DB_NAME"
psql -U postgres -c "DROP DATABASE IF EXISTS ${DB_NAME};";

echo "CREATE new db at $DB_NAME"
psql -U postgres -c "CREATE DATABASE ${DB_NAME};";

echo "ALTER DATABASE to use new schema search path"
psql -U postgres -c "ALTER DATABASE $DB_NAME SET search_path = public, extensions;";

echo "Load DB from $FILE_PATH"
pg_restore -d $DB_NAME -U postgres $FILE_PATH;

echo "...done"

echo "----------"
echo "Run update_db from exa (if available)";
echo "----------"
