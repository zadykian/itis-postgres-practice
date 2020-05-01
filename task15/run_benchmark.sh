#!/bin/bash

if [ $# != 1 ];
then
    echo 'Invalid arguments count'
    exit 1
fi

options+="--host=54.175.156.101 "
options+="--port=5432 "
options+="--user=zadykian "
options+="--progress=60 "

options+="--client=10 "
options+="--time=300 "

pgbench $options "dbname=postgres sslmode=$1 sslrootcert=root.crt sslcert=postgresql.crt sslkey=postgresql.key"