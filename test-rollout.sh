#!/bin/bash

# Use the URL you provided
URL="http://192.168.49.2:31401"

echo "Starting Zero-Downtime Test against $URL..."
echo "Press [CTRL+C] to stop."
echo "-----------------------------------------------"

# Counter for tracking requests
COUNT=0
SUCCESS=0
FAILED=0

while true; do
    COUNT=$((COUNT+1))
    
    # Perform the request and capture the status code and version
    RESPONSE=$(curl -s -w "%{http_code}" "$URL")
    STATUS_CODE="${RESPONSE: -3}"
    BODY="${RESPONSE%???}"
    VERSION=$(echo "$BODY" | grep -oP '"version":"\K[^"]+')

    if [ "$STATUS_CODE" -eq 200 ]; then
        SUCCESS=$((SUCCESS+1))
        echo "[$COUNT] ✅ SUCCESS | Version: $VERSION | Status: $STATUS_CODE"
    else
        FAILED=$((FAILED+1))
        echo "[$COUNT] ❌ FAILED  | Status: $STATUS_CODE"
    fi

    # Small sleep to avoid overwhelming the logs (0.2 seconds)
    sleep 0.2
done