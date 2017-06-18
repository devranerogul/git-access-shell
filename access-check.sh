#!/bin/bash

SUDO_EXEC=yes

LOG_FILE="${HOME}/ssh_filter.log"

function Log {
  DATE=$(date)
  echo "$DATE - $1" >> "$LOG_FILE"
}

response=$(curl --write-out %{http_code} --silent --output /dev/null http://www.digitalbueno.com/access.php?u=$1)

if [ "$response" = "200" ]
then
  Log "Executing [$SSH_ORIGINAL_COMMAND]."

  eval "$SSH_ORIGINAL_COMMAND"
fi

Log "Args $@"

Log "$1"