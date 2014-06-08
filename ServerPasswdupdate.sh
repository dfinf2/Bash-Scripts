#!/bin/sh
# Adam 
# Script to take a variable of servers, log in and change the password to a new one

# Servers go here
SERVERS=( SERVERS HERE )

# Enter a new password
stty -echo
echo  "Enter New Password:"
read pass
stty sane

# Enter the new password for verification
stty -echo
echo "Enter New Password for Verification:"
read verify
stty sane

# Enter old password to change
stty -echo
echo "Enter Old Password:"
read old
stty sane

# Test to make sure the new password was typed correctly
if [[ "$test" = "$verify" ]]
then
        for SERVER in ${SERVERS}
		do
			ssh user@$SERVER "echo -e '$old\n$pass\n$pass' | passwd";
done
else
        echo "Passwords do not match"
fi

exit