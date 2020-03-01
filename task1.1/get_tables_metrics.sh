#!/bin/bash

psqlOptions='--username postgres --tuples-only --no-align'

# Function to get size of table with name passed as argument '$1'.
function getTableSizeInBytes()
{
    if [ $# != 1 ];
    then
        echo 'Invalid arguments count'
        exit 1
    fi

    local tableName=$1 
    local commandText="select pg_relation_size('${tableName}'::regclass);"
    echo $(psql ${psqlOptions} --command "${commandText}")
}

# Function to get size of TOAST table associated with table named as '$1'.
function getToastTableSizeInBytes()
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

    local toastTableFullName=$(psql ${psqlOptions} --command "$commandText")
    echo $(getTableSizeInBytes $toastTableFullName)
}

# Function to measure execution time of select query to table with name '$1'.
function measureSelectQueryTime()
{
    if [ $# != 1 ];
    then
        echo 'Invalid arguments count'
        exit 1
    fi

    local tableName=$1;
    echo $(psql ${psqlOptions} --command "\timing true" --command "select * from ${tableName};" | tail -1)
}

schemaName='advanced_rds_task1'

for toastStrategy in 'plain' 'extended' 'external' 'main';
do
    tableName="${schemaName}.${toastStrategy}_table"
    originalTableSize=$(getTableSizeInBytes $tableName)
    toastTableSize=$(getToastTableSizeInBytes $tableName)
    selectQueryTime=$(measureSelectQueryTime $tableName)

    echo "
    ${toastStrategy^^}:
    Original table size: ${originalTableSize} bytes;
    TOAST table size: ${toastTableSize} bytes;
    ${selectQueryTime}"
done

exit 0