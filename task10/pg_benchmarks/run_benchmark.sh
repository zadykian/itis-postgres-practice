#!/bin/bash

if [ $# != 1 ];
then
    echo 'Invalid arguments count'
    exit 1
fi

options+="--host=advanced-rds-pg.csx2xlwomohu.us-east-1.rds.amazonaws.com "
options+="--port=5432 "
options+="--user=postgres "

options+="--file=select_benchmark.sql "
options+="--declare=table_name=$1"

options+="--client=50 "
options+="--time=300 "
options+="--no-vacuum "

options+="--log "
options+="--aggregate-interval=10 "
options+="--progress=30 "

pgbench $options "homeworkdb"