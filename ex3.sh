#!/bin/bash

verifica_ip() {
    nslookup "$1" "$3" | grep "^Address: $2$" > /dev/null ||
        echo "Bogus IP for $1 in /etc/hosts!"
}

cat /etc/hosts | while read ip name rest
do
    if [ -n "$ip" -a "${ip:0:1}" != "#" ]; then
        verifica_ip "$name" "$ip" "10.255.255.254"
    fi
done

exit 0
