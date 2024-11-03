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
        exit 1
    else
        echo "Git installtion is success"
    fi    
else
    echo "Git is already installed, no-installion pending"
fi

dnf install MySQL -y

if [ $? -ne 0 ]
then
    echo "MySQL is not installed, going to install"
    dnf install MySQL -y

    if [ $? -ne o ]
    then
        echo "MySQL installtion is failure, Plz verify"
        exit 1
    else
        echo "MySQL installion success"
    fi
else
    echo "MySQL is already installed"
fi
