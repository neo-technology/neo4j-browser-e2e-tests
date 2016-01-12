#!/usr/bin/env bash

URL="http://localhost:7474"

DIR=$(dirname $0)

if [ -z $1 ]; then
  echo "Using default url: $URL"
else
  URL=$1
  echo "Using url: $URL"
fi

function check_previous_status_code {
    status=$?
    if [ $status -ne 0 ]; then
        echo "error with $1" >&2
        exit $status
    fi
    return $status
}

node ./$DIR/node_modules/protractor/bin/webdriver-manager update

node ./$DIR/node_modules/protractor/bin/protractor $DIR/config/tests.js --baseUrl=$URL
check_previous_status_code
