#!/bin/bash

# Function to get size of table with name passed as argument '$1'.
function getTableSizeInBytes()
{
    if [ $# != 1 ];
    then
        echo 'Invalid arguments count'
        exit 1
    fi

    local tableName=$1 
    local commandText="select pg_relation_size(${table_name}::regclass);"
    local tableSizeInBytes=$(psql -U postgres -c $commandText)
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
    
    #todo
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
    #todo
}

schemaName='advanced_rds_task1'

for toastStrategy in 'plain' 'extended' 'external' 'main';
do
    tableName="${schemaName}.${toastStrategy}_table"
    originalTableSize=$(getTableSizeInBytes $tableName)
    toastTableSize=$(getToastTableSizeInBytes $tableName)
    selectQueryTime=$(measureSelectQueryTime $tableName)
done