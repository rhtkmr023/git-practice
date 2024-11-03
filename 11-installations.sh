#!/bin/bash/

USERID=$(id -u)
echo "User ID is: $USERID"

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root privileges"
    exit 1
fi

dnf install git

if [ $? -ne 0 ]
then
    echo "Git is not installed. Going to install"
    dnf install git -y
    if [ $? -ne 0 ]
    then
        echo "Git installation not success"
else
    echo "Git is already installed, no-installion pending"
fi
