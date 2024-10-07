
endpoint_url="your endpoint here"

if [ -z "$response" ]; then
    echo "IP address retrieve timeout"
    echo
else

    ip_address=$(echo $response | jq -r '.ip')
    date=$(echo $response | jq -r '.date')

    timestamp=$(date -d "$date" +%s)

    current_timestamp=$(date +%s)

    hours_ago=$((seconds_ago / 3600))
    minutes_ago=$(( (seconds_ago % 3600) / 60 ))

    echo "IP:" $ip_address
    echo "last updated:" $hours_ago "hours and" $minutes_ago "minutes ago"
    echo
fi