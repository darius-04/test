#!/bin/bash

nume_host="$1"
adresa_ip="$2"
dns_server="$3"

lookup_ip=$(dig +short "$nume_host" @"$dns_server")
lookup_host=$(dig +short -x "adresa_ip" @"$dns_server")

if [[ "$lookup_ip" == "$adresa_ip" && "$lookup_host" == "$nume_host" ]]; then
	echo "Asocierea este corecta"
else
	echo "Asocierea este incorecta"
fi	
