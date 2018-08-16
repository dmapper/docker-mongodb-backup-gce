#!/bin/bash

get_post_data()
{
  cat <<EOF
{"incident":{"type":"incident","title":"$1","service":{"id":"$PD_SERVICE","type":"service_reference"}}}
EOF
}

send_notification()
{
  curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/vnd.pagerduty+json;version=2' --header 'From: admin@idecisiongames.com' --header "Authorization: Token token=$PD_TOKEN" -d "$(get_post_data "$1")" 'https://api.pagerduty.com/incidents'
}