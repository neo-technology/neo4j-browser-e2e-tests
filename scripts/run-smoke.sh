#!/usr/bin/env bash

URL="http://localhost:7474"

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

node ./node_modules/protractor/bin/webdriver-manager update

node node_modules/protractor/bin/protractor config/sauce/init.js --baseUrl=$URL --multiCapabilities --browser=chrome --platform="OS X 10.10"
check_previous_status_code
node node_modules/protractor/bin/protractor config/sauce/sauce.js --baseUrl=$URL --multiCapabilities --browser=chrome --platform="OS X 10.10"
check_previous_status_code
