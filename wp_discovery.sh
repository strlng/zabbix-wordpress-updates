#!/bin/bash
WP_PATHS=($(find /var/www/* -maxdepth 2 -type f -name "wp-config.php" -exec dirname {} \;))

# JSON for Zabbix LLD 
FIRST=true
echo -n '{"data":['

for FULL_PATH in "${WP_PATHS[@]}"; do
    # extract the wp-folder name
    if [ "$FIRST" = true ]; then
        FIRST=false
    else
        echo -n ','
    fi
    echo -n "{\"{#WP_PATH}\":\"$FULL_PATH\"}"
done

echo -n ']}'