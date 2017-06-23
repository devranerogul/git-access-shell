#!/bin/bash

SUDO_EXEC=yes

LOG_FILE="${HOME}/ssh_filter.log"

function Log {
  DATE=$(date)
  echo "$DATE - $1" >> "$LOG_FILE"
}

# Repo name from SSH COMMAND : git-receive-pack ~/project.git
IFS=' ' read -r -a array <<< "$SSH_ORIGINAL_COMMAND"

Log "Requesting access for repo ${array[1]}"

response=$(curl --write-out %{http_code} --silent --output /dev/null http://api.kevlarapp.com/auth/$1/${array[1]})

if [ "$response" = "200" ]
then
  Log "Executing [$SSH_ORIGINAL_COMMAND]."

  eval "$SSH_ORIGINAL_COMMAND"
fi

Log "Args $@"

Log "$1"