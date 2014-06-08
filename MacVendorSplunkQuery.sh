#!/bin/bash

echo "This script will pull down and format a MAC Address search for Splunk for a specified Vendor"
echo "Where should we save working files? (e.g. /home/user/Desktop)"
read location
echo "Enter Company you want to search for:"
read company

mkdir $location
curl http://www.adminsub.net/mac-address-finder/$company > $location/file1
awk -F'>' '{ print $3 }' $location/file1 | awk -F'<' '{print $1}' | grep -Eo '[0-9A-Z]{6}' > $location/file2
sed 's/^\([0-9A-Fa-f]\{2\}\)\([0-9A-Fa-f]\{2\}\)\([0-9A-Fa-f]\{2\}\).*$/\1:\2:\3:/' $location/file2 > $location/file3
cat $location/file3 | xargs | sed -e 's/ / OR /g' > $location/$company
echo "You Splunk Search is Saved at $location/$company"