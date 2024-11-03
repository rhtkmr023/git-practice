#!/bin/bash/

echo "All variables passed to the script: $@"
echo "Number of variables in the script: $#"
echo "Script Name: $0"
echo "current working directory: $PWD"
echo "Home Directory of Current user: $HOME"
echo "PID of the script executing now: $$"
sleep 100 &
echo "PID of last background command: $!"