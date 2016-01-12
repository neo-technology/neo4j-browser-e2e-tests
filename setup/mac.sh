#!/bin/bash -eu

npm install
npm install -g phantomjs

node ./node_modules/protractor/bin/webdriver-manager update
