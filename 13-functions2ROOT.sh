#!/bin/bash/

USERID=$(id -u)
#echo "User ID is: $USERID"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "Please run this script with root privileges"
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is.. FAILED"
        exit 1
    else
        echo "$2 is..SUCCESS"
    fi
}

CHECK_ROOT

dnf list installed git

VALIDATE $? "Listing Git"

if [ $? -ne 0 ]
then
    echo "Git is not installed. Going to install"
    dnf install git -y
    VALIDATE $? "Installing GIT" 
else
    echo "Git is already installed, no-installion pending"
fi

dnf list installed mysql -y

if [ $? -ne 0 ]
then
    echo "MySQL is not installed, going to install"
    dnf install mysql -y

    VALIDATE $? "Installing MySQL"
else
    echo "MySQL is already installed"
fi
