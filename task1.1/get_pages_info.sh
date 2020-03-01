#!/bin/bash

psqlOptions='--username postgres --tuples-only --no-align'

# Function to get TOAST table name associated with table named as '$1'.
function getToastTableName()
{
    if [ $# != 1 ];
    then
        echo 'Invalid arguments count'
        exit 1
    fi

    local originalTableName=$1

    read -r -d '' commandText<<-sql
        select concat(pg_namespace.nspname, '.', toast_table.relname)
        from pg_catalog.pg_namespace
        inner join(
            select
                oid,
                relname,
                relnamespace
            from pg_catalog.pg_class
            where oid = (
                select reltoastrelid
                from pg_catalog.pg_class
                where oid = '${originalTableName}'::regclass))
            as toast_table
        on toast_table.relnamespace = pg_namespace.oid;
sql

    echo =$(psql ${psqlOptions} --command "$commandText")
}

schemaName='advanced_rds_task1'

for toastStrategy in 'plain' 'extended' 'external' 'main';
do
    originalTableName="${schemaName}.${toastStrategy}_table"
    toastTableName=$(getToastTableName $originalTableName)
done

exit 0