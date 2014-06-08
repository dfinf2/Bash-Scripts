#!/bin/bash
    #Requires the Delete.sh script
    #Found Here: http://pastebin.com/ZQAim1m5
    #Call the script like this: ./finddel.sh 76 /path/to/del/dir ... where 76 is disk 
    #percentage to start del after
     
     
    #set diskspace threshhold to delete from
    usageThreshhold=$1
     
    #function to exit if we receive a code 1
    test() {
        "$@"
        status=$?
        if [ $status -ne 0 ]; then
            echo "error with $1"
            exit 0
        fi
    }
     
     
    currentUsage=$(df -h | grep -i '/dev/sda1' | awk '{print $5}' | cut -d'%' -f1)
     
    while [[ $currentUsage -ge $usageThreshhold ]]
      do
        #use the test function from above to read the error code from the
        #script we call and decide if we should exit or continue
        test /foo/bar/delete.sh "$2";
        df -h
        sleep 3;
        #re-evaluate the size of usage
        currentUsage=$(df -h | grep -i '/dev/sda1' | awk '{print $5}' | cut -d'%' -f1)
    done