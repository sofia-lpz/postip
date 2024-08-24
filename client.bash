#!/bin/bash

endpoint_url="Here goes your url"

# Get the JSON response from the endpoint
response=$(curl -s -X GET $endpoint_url)

# Extract the IP address from the JSON response
ip_address=$(echo $response | jq -r '.ip')

echo $ip_address