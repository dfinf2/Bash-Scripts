#!/bin/bash

#receive directory to operate on from the CALLER
directory=$1
#get count of files currently in directory
fileCount=$("ls $directory | wc -l")

#if there are no more files, exit with code 1
if [ "$fileCount" == "0" ]; then
  exit 1;
#exlse delete the oldest file and exit with code 0
else
  filename=$(ls -tr $directory | head -n 1 )
  rm $directory/$filename
  exit 0
fi