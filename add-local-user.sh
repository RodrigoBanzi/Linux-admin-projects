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

passwd --stdin ${USER_NAME} | ${PASSWORD}

# check	to see if the useradd command succeeded



# set the password

# check	to see if the passwd command succeeded

# force	password change	on first login

# display the username,	password, and the host where the user was created

