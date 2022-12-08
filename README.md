## FusionAuth OpenAPI

This is an OpenAPI specification for the FusionAuth API.

You can find the file here:

[openapi.yaml](https://github.com/FusionAuth/fusionauth-openapi/blob/main/openapi.yaml)

It can be used in a variety of contexts, including generating client libraries, tracking API changes over time and testing. More here: https://openapi.tools/

Use this file to do all your OpenAPI related actions. For additional information and documentation on FusionAuth refer to [https://fusionauth.io](https://fusionauth.io).

To repeat, this is currently **experimental** and we make no promises about backwards compatibility.


### Generate libraries

Install either Swagger: https://github.com/swagger-api/swagger-codegen/ or openapi: https://github.com/OpenAPITools/openapi-generator

These instructions will be for openapi.

#### Java

```
npx @openapitools/openapi-generator-cli generate -i openapi.yaml  -g java -o java
cd java
mvn package
# use jar
```

#### Ruby

To build the ruby client libraries:

Create a file called `postprocess.sh`. Put this in the file (make sure to update with the correct `sed` path):

```
/path/to/sed -i "" 's/END = "end".freeze/END_ENUM = "end".freeze/' $1
```

Set an environment variable with the full path of this script:

```
export RUBY_POST_PROCESS_FILE=/path/to/postprocess.sh
```

Copy the `openapi.yaml` file to your current directory.

Then generate the library:

```
npx @openapitools/openapi-generator-cli generate  --enable-post-process-file  -i openapi.yaml  -g ruby -o ruby
```

More docs here: https://openapi-generator.tech/docs/generators/ruby

### Test the YAML

```
pip3 install schemathesis # one time
schemathesis run -vvvv --checks not_a_server_error openapi.yaml --base-url http://localhost:9011 -H "Authorization: bf69486b-4733-4470-a592-f1bfce7af580" 
```

## Known issues

While the specification is valid, the generated client libraries haven't been fully exercised.

* FusionAuth uses polymorphic responses for some API calls, particularly Identity Providers. The support for that in client library generation code is problematic, based on our testing. I'm not sure if there are workarounds, but it seems like some work is being done. See https://github.com/swagger-api/swagger-codegen/issues/10011 and https://github.com/OpenAPITools/openapi-generator/issues/10880#issuecomment-995243186 for an openapi workaround.
* This spec is built using the [fusionauth-client-builder](https://github.com/fusionauth/fusionauth-client-builder) project JSON files. This covers almost all of the API, but not everything. A few calls may be missing. If you find one that you need, please open a bug report.
* Deprecated API endpoints are not included.
* There's no information about what parameters are required or not, because that is not part of the API JSON files.
* There are certain operations, status codes and security mechanisms (JWT auth, cookies for auth) that are not currently supported because they are not included in the API JSON files.
* OAuth grant actions aren't currently supported (the /oauth2/ endpoints).
* There is an issue generating the ruby client libraries. https://github.com/OpenAPITools/openapi-generator/issues/11350 has the repro steps. The `RUBY_POST_PROCESS_FILE` environment variable is a workaround.

## Postman Collection

You can also explore around with our API in postman.

Here's our [Postman profile](https://www.postman.com/fusionauth) and [public workspace](https://www.postman.com/fusionauth/workspace).

### Import Postman Collection

* Log into the FusionAuth Postman team 
* Click the `Import` button on the left hand nav, toward the top
* Import the API definition. This should also create a new collection
* Rename the API and collection with the correct API version
* Copy over the description from a previously imported API (easiest to do it in two tabs)
* Copy the new collection into the workspace.


## Next steps

We are publishing this to see how useful the FusionAuth community finds it. We welcome feedback on your usage of this spec. We'll plan to revisit this after we've received some feedback on how useful it is and determine if there are additional features we need to implement.

Please open bugs on this repository. For support in using this, please see the next section.

## Questions and support

If you have a question or support issue regarding this OpenAPI spec, we'd love to hear from you.

If you have a paid edition with support included, please [open a ticket in your account portal](https://account.fusionauth.io/account/support/). Learn more about [paid editions here](https://fusionauth.io/pricing).

Otherwise, please [post your question in the community forum](https://fusionauth.io/community/forum/).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/FusionAuth/go-client.

If you find an issue with syntax, etc - this is likely a bug in the generation script. Feel free to submit a PR against the Client Builder project.
- [Client Builder](https://github.com/FusionAuth/fusionauth-client-builder)
- [build-openapi-yaml.rb](https://github.com/FusionAuth/fusionauth-client-builder/blob/master/bin/build-openapi-yaml.rb)

## License

The code is available as open source under the terms of the [Apache v2.0 License](https://opensource.org/licenses/Apache-2.0).
