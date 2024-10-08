#!/bin/bash

get_ip_address() {
   hostname -I | grep -o '^[^ ]*'
}

current_ip_address=$(get_ip_address)
ip_txt_path="ip.txt"
repo_path="/path/to/your/repo"

cd "$repo_path" || exit

if [ -f "$ip_txt_path" ]; then
    stored_ip_address=$(cat "$ip_txt_path")
else
    stored_ip_address=""
fi

if [ "$current_ip_address" != "$stored_ip_address" ]; then

    current_date=$(date +"%Y-%m-%d %H:%M:%S")
    echo "$current_ip_address" > "$ip_txt_path"

    git add "$ip_txt_path"
    git commit -m "Update IP address on $current_date"
    git push origin main

    echo "IP address has changed. Updated ip.txt and pushed changes to GitHub."
else
    echo "IP address has not changed."
fi