#!/bin/bash

options+="--host=localhost "
options+="--port=5432 "
options+="--user=postgres "
options+="--transactions=$1 "
options+="--progress=60"

pgbench $options "postgres"