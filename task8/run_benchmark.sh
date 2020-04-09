#!/bin/bash

options+="--host=localhost "
options+="--port=5432 "
options+="--user=postgres "
options+="--progress=60 "

options+="--client=100 "
options+="--scale=500 "
options+="--time=300 "


pgbench $options "postgres"