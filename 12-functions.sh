#!/bin/bash/

USERID=$(id -u)
#echo "User ID is: $USERID"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is.. FAILED"
        exit 1
    else
        echo "$2 is..SUCCESS"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root privileges"
    exit 1
fi

dnf list installed git

VALIDATE $? "Listing Git"

# if [ $? -ne 0 ]
# then
#     echo "Git is not installed. Going to install"
#     dnf install git -y
#     if [ $? -ne 0 ]
#     then
#         echo "Git installation not success"
#         exit 1
#     else
#         echo "Git installtion is success"
#     fi    
# else
#     echo "Git is already installed, no-installion pending"
# fi

# dnf list installed mysql -y

# if [ $? -ne 0 ]
# then
#     echo "MySQL is not installed, going to install"
#     dnf install mysql -y

#     if [ $? -ne o ]
#     then
#         echo "MySQL installtion is failure, Plz verify"
#         exit 1
#     else
#         echo "MySQL installion success"
#     fi
# else
#     echo "MySQL is already installed"
# fi
