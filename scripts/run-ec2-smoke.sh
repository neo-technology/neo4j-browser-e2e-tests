#!/usr/bin/env bash

TEST_LOCATION=$(pwd)
WORKBENCH_LOCATION=""
PACKAGE_URI=""

function finish {
  pushd $WORKBENCH_LOCATION
  ./neo-workbench estate terminate $ESTATE
  popd
}

if [ -z ${SAUCE_USERNAME+x} ]; then
  printf "SAUCE_USERNAME is unset";
  exit 1;
fi

if [ -z ${SAUCE_ACCESS_KEY+x} ]; then
  printf "SAUCE_ACCESS_KEY is unset";
  exit 1;
fi

if [ -z $1 ]; then
  printf "Missing WORKBENCH_LOCATION param"
  exit 1;
else
  WORKBENCH_LOCATION=$1
  printf "Workbench location: $URL"
fi

if [ -z $2 ]; then
  printf "Version of neo4j not specified"
  trap finish EXIT
else
  PACKAGE_URI=$2
  printf "Running version $PACKAGE_URI"
  trap finish EXIT
fi

pushd $WORKBENCH_LOCATION

ESTATE=$(./neo-workbench estate add database --platform aws --size 1 --database:jvm java8)
ESTATE_FILE=$(echo $ESTATE | cut -c 6-)

BASE_URL=$(cat $ESTATE_FILE | python -c 'import sys, json; print json.load(sys.stdin)["estate"]["blocks"][0]["machines"][0]["publicDnsName"]')
BASE_URL="http://$BASE_URL:7474"
./neo-workbench database install --mode Single --package-uri $PACKAGE_URI $ESTATE
./neo-workbench database start $ESTATE --password neo4j &

echo "Waiting for neo4j to be available"
sleep 60

popd
./scripts/run-smoke.sh $BASE_URL