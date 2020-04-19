#!/bin/bash

if [ $# != 1 ];
then
    echo 'Invalid arguments count'
    exit 1
fi

options+="--host=advanced-rds-pg.csx2xlwomohu.us-east-1.rds.amazonaws.com "
options+="--port=5432 "
options+="--user=postgres "

options+="--file=$1 "
options+="--time=300 "
options+="--no-vacuum "

options+="--log "
options+="--log-prefix=pgbench_log_$1 "
options+="--aggregate-interval=10 "
options+="--progress=30 "

pgbench $options "homeworkdb"