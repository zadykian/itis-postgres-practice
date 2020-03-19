#!/bin/bash
#script to generate random string of length $1

if [ $# != 1 ]; 
then
    echo 'Invalid arguments count'
    exit 1
fi

randomStringLength=$1

cat /dev/urandom | tr -dc 'a-z0-9' | fold -w $randomStringLength | head -n 1