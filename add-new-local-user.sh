#!/bin/bash

# this script is used to create an user in the local system with a 
# random generated password which will have to be changed on the first login


# make sure the script is being executed with superuser privileges

USER_ROOT_TO_COMPARE=0

if [[ "${UID}" -ne "${UID_ROOT_TO_COMPARE}" ]]
then
        echo "You must be root to execute this"        
        exit 1
fi      



# if the user doesn't supply at least one argument, then give them help

if [[ "${#}" -lt 1 ]]
then
	echo "You should supply at least one argument, try again"
	exit 1
fi


# the first parameter is the user name

USER_NAME=${1}
echo ${USER_NAME}

# the rest of the parameters are for the account comments

# to be continued

# generate a password

PASSWORD=$(date +%s%N | sha256sum | head -c48)

# create the user with the password

useradd -m ${USER_NAME}

# check to see if the useradd command succeeded

if [[ "${?}" -eq 0 ]]
then
        echo "The user was configured accordingly."
fi

# set the password

echo "${PASSWORD}" | passwd ${USER_NAME} --stdin

# check to see if the passwd command succeeded

if [[ "${?}" -eq 0 ]]
then
        echo "The password was configured accordingly."
fi

# force password change on first login

passwd -e ${USER_NAME}

# display the username, password, and the host where the user was created

echo 'username: '
echo "${USER_NAME}"
echo 'password: '
echo "${PASSWORD}"
echo

