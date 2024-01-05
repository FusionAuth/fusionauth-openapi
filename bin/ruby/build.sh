#!/bin/sh


dir=$(pwd)

# See https://github.com/OpenAPITools/openapi-generator/pull/17537 for fix that will land in 7.3.0 so we don't have to use the post process file
export RUBY_POST_PROCESS_FILE=$dir/bin/ruby/postprocess.sh

npx @openapitools/openapi-generator-cli generate  --enable-post-process-file  -i openapi.yaml  -g ruby -o ruby

# consider --additional-properties=gemVersion=1.49 to track versions of FusionAuth.
