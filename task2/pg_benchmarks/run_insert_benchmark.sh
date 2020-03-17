#!/bin/bash

if [ $# != 1 ];
then
    echo 'Invalid arguments count'
    exit 1
fi

pgbenchOptions="--host=advanced-rds-pg.csx2xlwomohu.us-east-1.rds.amazonaws.com "
pgbenchOptions+="--port=5432 "
pgbenchOptions+="--user=postgres "
pgbenchOptions+="--time=5 "
pgbenchOptions+="--define=table_name=$1 "
pgbenchOptions+="--file=insert_benchmark.sql "
pgbenchOptions+="homeworkdb"

pgbench $pgbenchOptions