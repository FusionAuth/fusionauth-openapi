#!/bin/sh

npx @openapitools/openapi-generator-cli generate -i openapi.yaml  -g java -o java

cd java

mvn package

cd -
