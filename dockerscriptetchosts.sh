#!/bin/bash

CONTAINER_ALREADY_STARTED="CONTAINER_ALREADY_STARTED_PLACEHOLDER"
if [ ! -e $CONTAINER_ALREADY_STARTED ]; then
    touch $CONTAINER_ALREADY_STARTED
    echo "-- First container startup --"

    # YOUR_JUST_ONCE_LOGIC_HERE
 
	line=$(grep 192.168 /etc/hosts)
	line2=$(echo $line | awk '{print $2}')
 
	echo "$line $line2.localdomain" >> /etc/hosts

	/etc/init.d/sendmail reload

else
    echo "-- Not first container startup --"
fi
