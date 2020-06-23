#!/bin/bash

line=$(grep -m 1 192.168 /etc/hosts)
        line2=$(echo $line | awk '{print $2}')

        echo "$line $line2.localdomain" >> /etc/hosts

        /etc/init.d/sendmail reload
