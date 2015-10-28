#!/usr/bin/env bash

URL="http://localhost:7474"
if [ -z $1 ]; then
  echo "Using default url: $URL"
else
  URL=$1
  echo "Using url: $URL"
fi

protractor local.js --baseUrl=$URL