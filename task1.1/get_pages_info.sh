#!/bin/bash

schemaName='advanced_rds_task1'
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

    echo $(psql ${psqlOptions} --command "$commandText")
}

# Function to get information about first page of table named as '$1'
function printFirstPageInfo()
{
    if [ $# != 1 ];
    then
        echo 'Invalid arguments count'
        exit 1
    fi

    local tableName=$1
    local pageIndex=0
    local tuplesDisplayLimit=4

    read -r -d '' commandText<<-sql
        set search_path to ${schemaName};
        select
            table_len / 8192 as pages_count,
            tuple_count
        from pgstattuple('${tableName}'::regclass);
sql
    local pgstattupleResult=$(psql ${psqlOptions} --command "$commandText")
    local oldIFS=$IFS
    IFS='|'
    read -r -a tokens <<< $pgstattupleResult
    IFS=$oldIFS
    local pagesCount=${tokens[0]}
    local tuplesCount=${tokens[1]}

    echo "  Table '${tableName}' contains '${pagesCount}' pages and '${tuplesCount}' tuples."
    if [ $tuplesCount == 0 ];
    then
        return
    fi 

    read -r -d '' commandText<<-sql
        set search_path to ${schemaName};
        select count(*)
        from heap_page_items(get_raw_page('${tableName}', $pageIndex));
sql

    local pageTuplesCount=$(psql ${psqlOptions} --command "$commandText")
    echo "  Page '${pageIndex}' tuples count: ${pageTuplesCount};"

    read -r -d '' commandText<<-sql
    set search_path to ${schemaName};
    select
        t_ctid as ctid,
        lp_len as size_in_bytes
    from heap_page_items(get_raw_page('${tableName}', $pageIndex))
    limit ${tuplesDisplayLimit};
sql

    echo "  First ${tuplesDisplayLimit} tuples of page '${pageIndex}':"
    echo "  "$(psql --username postgres --no-align --command "$commandText")
}

psql $psqlOptions <<sql 
    create extension if not exists pageinspect
    with schema ${schemaName};
    create extension if not exists pgstattuple
    with schema ${schemaName};
sql

for toastStrategy in 'plain' 'extended' 'external' 'main';
do
    originalTableName="${schemaName}.${toastStrategy}_table"
    toastTableName=$(getToastTableName $originalTableName)

    echo "${toastStrategy^^}"
    echo "Original table:"
    printFirstPageInfo $originalTableName
    echo "TOAST table:"
    printFirstPageInfo $toastTableName
    echo ""
done

exit 0