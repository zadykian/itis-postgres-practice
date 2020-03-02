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

for fillfactorValue in 50 75 90 100;
do
    tableName="${schemaName}.fillfactor_${fillfactorValue}_table"
    columnName='varchar_column'

    tabeSizeBeforeUpdate=$(getTableSizeInBytes ${tableName})
    selectQueryTimeBeforeUpdate=$(measureSelectQueryTime ${tableName} $columnName)

    updateQueryTime=$(measureUpdateQueryTime $tableName $columnName)

    tableSizeAfterUpdate=$(getTableSizeInBytes ${tableName})
    selectQueryTimeAfterUpdate=$(measureSelectQueryTime ${tableName} $columnName)

    echo "
    Fillfactor '${fillfactorValue}':
      Table size before update: ${tabeSizeBeforeUpdate} bytes;
      Select query before update: '${selectQueryTimeBeforeUpdate}'
      Update query: '${updateQueryTime}'
      Table size after update: ${tableSizeAfterUpdate} bytes;
      Select query after update: '${selectQueryTimeAfterUpdate}'
    "
done