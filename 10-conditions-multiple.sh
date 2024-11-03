#!/bin/bash/

NUMBER0=$1
NUMBER1=$2
NUMBER2=$3


if [ { $NUMBER0, $NUMBER1, $NUMBER2 } -gt 40 ] #gt, lt, eq, -ne, -le, -ge
then
    echo "Given number: { $NUMBER0, $NUMBER1, $NUMBER2 } is greater than 40"
else
    echo "Given number: { $NUMBER0, $NUMBER1, $NUMBER2 } is less than 40"
fi
