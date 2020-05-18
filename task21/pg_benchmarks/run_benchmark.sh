#!/bin/bash

if [ $# != 1 ];
then
    echo 'Invalid arguments count'
    exit 1
fi

options+="--host=advanced-rds-pg.csx2xlwomohu.us-east-1.rds.amazonaws.com "
options+="--port=5432 "
options+="--user=postgres "

options+="--file=$1_benchmark.sql "
options+="--no-vacuum "

options+="--client=10 "
options+="--time=300 "
options+="--progress=60 "

pgbench $options "homeworkdb"