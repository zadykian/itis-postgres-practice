#!/bin/bash

options+="--host=54.175.156.101 "
options+="--port=5432 "
options+="--user=postgres "
options+="--progress=60 "

options+="--client=10 "
options+="--time=300 "

pgbench $options "postgres"