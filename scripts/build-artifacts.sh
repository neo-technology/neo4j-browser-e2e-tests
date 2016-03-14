#!/bin/sh

cd standalone
releaseName=$1
libraryName=$2
tar -zxvf <releaseName>-unix.tar.gz
cd <releaseName>

rm -f lib/neo4j-browser*.jar

popd

cp artifact/neo4j-browser*.jar <releaseName>lib
