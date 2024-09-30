#!/bin/bash

get_ip_address() {
   hostname -I | grep -o '^[^ ]*'
}

endpoint_url=''

echo $endpoint_url
ip_address=$(get_ip_address)

current_date=$(date +"%Y-%m-%d %H:%M:%S")

json_name="ip_info"

curl -X PUT -H "Content-Type: application/json" -d "{\"ip\": \"$ip_address\", \"date\": \"$current_date\"}" $endpoint_url
