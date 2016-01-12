#!/usr/bin/env bash

URL="http://localhost:7474"

DIR=$(dirname $0)

if [ -z ${SAUCE_USERNAME+x} ]; then
  echo "SAUCE_USERNAME is unset";
  exit 1;
fi

if [ -z ${SAUCE_ACCESS_KEY+x} ]; then
  echo "SAUCE_ACCESS_KEY is unset";
  exit 1;
fi

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
