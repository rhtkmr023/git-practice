#!/bin/bash/

NUMBER=$1

if [ $NUMBER -gt 40 ] #gt, lt, eq, -ne, -le, -ge
then
    echo "Given number: $NUMBER is greater than 40"
else
    echo "Given number: $NUMBER is less than 40"
fi