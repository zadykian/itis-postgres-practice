#!/bin/bash

options+="--host=advanced-rds-pg.csx2xlwomohu.us-east-1.rds.amazonaws.com "
options+="--port=5432 "
options+="--user=postgres "
options+="--file=select_benchmark.sql "
options+="--time=300 "
options+="--progress=60 "

pgbench $options "homeworkdb"