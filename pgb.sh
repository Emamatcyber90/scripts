#!/bin/sh

DB_NAME=$1
DB_FILE=$2

[ -z "$DB_NAME" ] && echo "Usage: pgb [[DB_NAME] [DB_FILE]]" && exit 1;
[ -z "$DB_FILE" ] && DB_FILE=$DB_NAME;

FILE_PATH="${HOME}/${DB_FILE}"

echo "Saving backup of DB ${DB_NAME} to ${FILE_PATH}";
pg_dump -U postgres --no-owner --encoding UTF8 --format custom --file $FILE_PATH $DB_NAME;
