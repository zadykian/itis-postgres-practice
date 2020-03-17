#!/bin/bash

if [ $# != 2 ];
then
    echo 'Invalid arguments count'
    exit 1
fi

pgbenchOptions='--host=advanced-rds-pg.csx2xlwomohu.us-east-1.rds.amazonaws.com '
pgbenchOptions+='--port=5432 '
pgbenchOptions+='--user=postges '
pgbenchOptions+='--time=500 '
pgbenchOptions+='--define=tableName=$1 '
pgbenchOptions+='--file=insert_benchmark.sql '
pgbenchOptions+='homeworkdb'

pgbench $pgbenchOptions