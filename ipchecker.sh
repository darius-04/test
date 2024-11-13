#!/bin/bash

while IFS= read -r line; do
	ip=$(echo "$line" | awk '{print $1}')
	nume=$(echo "$line" | awk '{print $2}')
	ip_lookup=$(nslookup "$nume" | awk '/^Address: / {print $2; exit}')
	if [ "$ip" != "$ip_lookup" ]; then
		echo "Bogus IP for $nume in /etc/hosts !"
	fi
done < /etc/hosts
