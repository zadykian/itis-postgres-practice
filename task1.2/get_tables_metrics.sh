#!/bin/bash
psqlOptions='--username postgres --tuples-only --no-align'
schemaName='advanced_rds_task1_2'

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

# Function to measure execution time of update query.
function measureUpdateQueryTime()
{
        if [ $# != 2 ];
    then
        echo 'Invalid arguments count'
        exit 1
    fi

    local tableName=$1 
    local varcharColumnName=$2

    read -r -d '' commandText<<-sql
        update $tableName
        set $varcharColumnName = concat($varcharColumnName, $varcharColumnName);
sql

    echo $(psql ${psqlOptions} --command "\timing true" --command "${commandText}" | tail -1)
}

# Function to measure execution time of select query.
function measureSelectQueryTime()
{
    if [ $# != 2 ];
    then
        echo 'Invalid arguments count'
        exit 1
    fi

    local tableName=$1 
    local varcharColumnName=$2

    read -r -d '' commandText<<-sql
        select *
        from $tableName
        where $varcharColumnName like '%abc%';
sql

    echo $(psql ${psqlOptions} --command "\timing true" --command "${commandText}" | tail -1)
}

# Function to get information about table's page.
function getPageInfo()
{
    if [ $# != 2 ];
    then
        echo 'Invalid arguments count'
        exit 1
    fi

    local tableName=$1
    local pageNumber=$2

    read -r -d '' commandText<<-sql
        set search_path to ${schemaName};
        select lower, upper
        from page_header(get_raw_page('${tableName}', $pageNumber));
sql

    echo $(psql $psqlOptions --command "${commandText}" | tail -1)
}

psql $psqlOptions <<sql
    create extension if not exists pageinspect
    with schema ${schemaName};
sql

for fillfactorValue in 50 75 90 100;
do
    tableName="${schemaName}.fillfactor_${fillfactorValue}_table"
    columnName='varchar_column'

    tabeSizeBeforeUpdate=$(getTableSizeInBytes $tableName)
    selectQueryTimeBeforeUpdate=$(measureSelectQueryTime $tableName $columnName)
    firstPageInfoBeforeUpdate=$(getPageInfo $tableName 0)

    updateQueryTime=$(measureUpdateQueryTime $tableName $columnName)

    tableSizeAfterUpdate=$(getTableSizeInBytes $tableName)
    selectQueryTimeAfterUpdate=$(measureSelectQueryTime $tableName $columnName)
    firstPageInfoAfterUpdate=$(getPageInfo $tableName 0)

    echo "
    Fillfactor '${fillfactorValue}':
      Before update:
        Table size: ${tabeSizeBeforeUpdate} bytes;
        Select query: '${selectQueryTimeBeforeUpdate}'
        First page lower+upper: '${firstPageInfoBeforeUpdate}'
      Update query: '${updateQueryTime}'
      After update:
        Table size: ${tableSizeAfterUpdate} bytes;
        Select query: '${selectQueryTimeAfterUpdate}'
        First page lower+upper: '${firstPageInfoAfterUpdate}'
    "
done