#!/bin/bash

options+="--host=advanced-rds-pg.csx2xlwomohu.us-east-1.rds.amazonaws.com "
options+="--port=5432 "
options+="--dbname=homeworkdb "
options+="--user=postgres "
options+="--no-password "

read -r -d '' commandText<<sql
    update task_6.hub_table
    set id = id + 1000000 + random() * 10
    where id = parent_table_id
sql

for row_id in $(seq 1 1000000);
do
    psql $options --command $(commandText//parent_table_id/$row_id)
done