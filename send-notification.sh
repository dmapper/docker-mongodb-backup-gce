#!/bin/bash
#set -x

MAILGUN_APIKEY="$MAILGUN_APIKEY"
recipients="theolegmakarov@gmail.com"

send_notification()
{
curl -s --user "$MAILGUN_APIKEY" https://api.mailgun.net/v3/idecisiongames.com/messages -F from=lingua.dev@gmail.com -F to="$recipients" -F subject="$1" -F text="Please check the errors on k8s deployment"
}
