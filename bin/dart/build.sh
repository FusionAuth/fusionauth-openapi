#!/bin/sh

npx @openapitools/openapi-generator-cli generate -i openapi.yaml  -g dart -o dart

cd dart

dart create -t package fusionauth_dart_client