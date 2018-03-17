#!/bin/sh

DB_NAME=$1
DB_FILE=$2

[ -z "$DB_NAME" ] && echo "Usage: pgr [[DB_NAME] [DB_FILE_NAME]]" && exit 1;
[ -z "$DB_FILE" ] && DB_FILE=$DB_NAME;

FILE_PATH="${HOME}/${DB_FILE}"

echo "DROP/CREATE $DB_NAME"
psql -U postgres -c "DROP DATABASE IF EXISTS ${DB_NAME};";
psql -U postgres -c "CREATE DATABASE ${DB_NAME}";

echo "Load DB"
pg_restore -d $DB_NAME -U postgres $FILE_PATH;

echo "----------"
echo "Run update_db from exa (if available)";
echo "----------"

if [ -d $HOME/exa ]; then

    psql -U postgres --dbname $DB_NAME --file $HOME/exa/resx/db/updates.sql \
        --no-psqlrc --set ON_ERROR_STOP=1 --no-password --quiet \
        --tuples-only --echo-errors

fi;
