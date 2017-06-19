#! /bin/sh

# Get the JSON from the Livebox API
url="http://192.168.0.1/ws"
status="$(curl -s -X POST -H "Content-Type: application/x-sah-ws-1-call+json" -d '{"service":"NMC","method":"getWANStatus","parameters":{}}' "$url")"

# Display the wanted information according to the first arg
if [ "$1" = "wan" ]; then
  wan="$(echo $status | jq -r '.result.data.WanState')"
  if [ "$wan" = "up" ]; then
    echo "Up"
    exit 0
  else
    echo "Down"
    exit 1
  fi
elif [ "$1" = "ip" ]; then
  echo $(echo $status | jq -r '.result.data.IPAddress')
elif [ "$1" = "ip6" ]; then
  echo $(echo $status | jq -r '.result.data.IPv6Address')
else
  echo "Usage : "$0" wan|ip|ip6"
fi
