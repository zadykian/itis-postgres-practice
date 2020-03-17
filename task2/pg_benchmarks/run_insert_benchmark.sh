#!/bin/bash

if [ $# != 3 ];
then
    echo 'Invalid arguments count'
    exit 1
fi

pgbenchOptions="--host=advanced-rds-pg.csx2xlwomohu.us-east-1.rds.amazonaws.com "
pgbenchOptions+="--port=5432 "
pgbenchOptions+="--user=postgres "
pgbenchOptions+="--define=table_name=$1 "
pgbenchOptions+="--time=$2 "
pgbenchOptions+="--client=$3 "
pgbenchOptions+="--file=insert_benchmark.sql "
pgbenchOptions+="--no-vacuum "

pgbenchOptions+="homeworkdb"

pgbench $pgbenchOptions