#!/bin/bash

cat /etc/hosts | while read ip name rest
do
    if [ -n "$ip" -a "${ip:0:1}" != "#" ]; then
        nslookup $name | grep $ip > /dev/null || echo "Bogus IP for $name in /etc/hosts!"
    fi
done

exit 0
