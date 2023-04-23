#!/bin/sh

#
# Turn Philips Hue lights on/off
#
# Dependencies: curl, jq
#

IP=""
USER=""

LIGHTS=$(curl -s -k https://$IP/api/$USER/lights | jq -r "keys[]")

change_light() {
    for ID in $(echo $LIGHTS); do
        curl -s -k -X PUT https://$IP/api/$USER/lights/$ID/state --data "{\"on\": $1}"
    done
}

if [ $1 == "true" ] || [ $1 == "on" ]; then
    change_light true
elif [ $1 == "false" ] || [ $1 == "off" ]; then
    change_light false
fi

