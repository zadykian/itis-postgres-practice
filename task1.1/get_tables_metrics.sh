#!/bin/bash

# Function to get size of table with name passed as argument '$1'.
function getOriginalTableSizeInBytes()
{
    if [ $# != 1 ];
    then
        echo 'Invalid arguments count'
        exit 1
    fi

    local tableName=$1
    #todo
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

schemaName='advanced_rds_task1'

for toastStrategy in 'plain' 'extended' 'external' 'main';
do
    tableName="${schemaName}.${toastStrategy}_table"
    originalTableSize=$(getOriginalTableSizeInBytes $tableName)
    toastTableSize=$(getToastTableSizeInBytes $tableName)
done