#!/bin/bash

# This script creates users in the local system	if the user who	runs it	is a root user

# get the username (login)

USER_ROOT_TO_COMPARE=0

if [[ "${UID}" -ne "${UID_ROOT_TO_COMPARE}" ]]
then
        echo "You must be root to execute this"        
        exit 1
fi	

# get the real name (contents for the description field).

read -p	'Enter the username to create: ' USER_NAME

# get the password 


read -p 'Enter the password for	the user: ' PASSWORD

echo "${USER_NAME}"
echo "${PASSWORD}"

# create the user with the password

useradd	-m ${USER_NAME}	


# check	to see if the useradd command succeeded

if [[ "${?}" -ne 0 ]]
then
	echo "The ${USER_NAME} user was not added."
	exit 1
fi

# set the password

if [[ "${?}" -ne 0 ]]
then
	echo "The password did not work."
	exit 1
else
	echo ${PASSWORD} | passwd ${USER_NAME}
fi

# check	to see if the passwd command succeeded

if [[ "${?}" -eq 0 ]]
then
        echo "The password was configured accordingly."
fi

# force	password change	on first login

passwd -e ${USER_NAME}


# display the username,	password, and the host where the user was created

echo 'username: '
echo "${USER_NAME}"
echo 
echo 'password: '
echo "${PASSWORD}"

