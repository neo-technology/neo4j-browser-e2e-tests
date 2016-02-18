#!/bin/sh
./neokit/neoget -i milestone

./neokit/neoctl unzip milestone
./neokit/neoctl start milestone

./run-local.sh
./neokit/neoctl stop milestone

./neokit/neoctl unzip milestone
./neokit/neoctl start milestone

curl -O https://m2.neo4j.org/content/repositories/snapshots/org/neo4j/app/neo4j-browser/3.0.0-SNAPSHOT/neo4j-browser-3.0.0-20160112.041156-98.jar

rm -rf ~/.neokit/run/community-3.0.0-M02/neo4j-community-3.0.0-M02/system/lib/*browser*.jar
cp neo4j-browser-3.0.0-20160112.041156-98.jar ~/.neokit/run/community-3.0.0-M02/neo4j-community-3.0.0-M02/system/lib/

./run-local.sh
./neokit/neoctl stop milestone
