## FusionAuth OpenAPI

This is an **experimental** OpenAPI specification for the FusionAuth API.

You can find the file here:

[openapi.yaml](https://github.com/FusionAuth/fusionauth-openapi/blob/main/openapi.yaml)

It can be used in a variety of contexts, including generating client libraries, tracking API changes over time and testing. More here: https://openapi.tools/

Use this file to do all your OpenAPI related actions. For additional information and documentation on FusionAuth refer to [https://fusionauth.io](https://fusionauth.io).

## Test the YAML

```
pip3 install schemathesis # one time
schemathesis run -vvvv --checks not_a_server_error openapi.yaml --base-url http://localhost:9011 -H "Authorization: bf69486b-4733-4470-a592-f1bfce7af580" 
```

### Generate libraries

Install either Swagger: https://github.com/swagger-api/swagger-codegen/ or openapi: https://github.com/OpenAPITools/openapi-generator

Java

```
cd <dir>
swagger-codegen generate  --group-id io.fusionauth --artifact-id fusionauth-client-library-codegen --artifact-version 1.0.2-SNAPSHOT --api-package io.fusionauth.codegen.api  --invoker-package io.fusionauth.codegen.invoker --model-package io.fusionauth.codegen.model -l java -o . -i ../fusionauth-client-builder/bin/openapi.yaml
```

Ruby
```
npx @openapitools/openapi-generator-cli generate -i ../fusionauth-client-builder/bin/openapi.yaml -g ruby -o . 
```

## Known issues

While the specification is valid, the generated client libraries haven't been fully exercised.

* FusionAuth uses polymorphic responses for some API calls, particularly Identity Provider. The support for that in client library generation code is problematic, based on our testing. I'm not sure if there are workarounds, but it seems like some work is being done. See https://github.com/swagger-api/swagger-codegen/issues/10011 for example.
* This spec is built using the [fusionauth-client-builder](https://github.com/fusionauth/fusionauth-client-builder) project JSON files. This covers almost all of the API, but not everything. A few calls may be missing. If you find one that you need, please open a bug report.
* There's no information about what parameters are required or not, because that is not part of the API JSON files.
* There are certain operations, status codes and security mechanisms (JWT auth, cookies for auth) that are not currently supported because they are not included in the API JSON files.
* OAuth grant actions aren't currently supported (the /oauth2/ endpoints).

## Next steps

We are putting this out to see how useful the FusionAuth community finds it. We welcome feedback on your usage of this spec. We'll plan to revisit this after we've received some feedback on how useful it is and determine if there are additional features we need to implement.

## Questions and support

If you have a question or support issue regarding this OpenAPI sepc, we'd love to hear from you.

If you have a paid edition with support included, please [open a ticket in your account portal](https://account.fusionauth.io/account/support/). Learn more about [paid editions here](https://fusionauth.io/pricing/).

Otherwise, please [post your question in the community forum](https://fusionauth.io/community/forum/).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/FusionAuth/go-client.

If you find an issue with syntax, etc - this is likely a bug in the generation script. Feel free to submit a PR against the Client Builder project.
- [Client Builder](https://github.com/FusionAuth/fusionauth-client-builder)
- [build-openapi-yaml.rb](https://github.com/FusionAuth/fusionauth-client-builder/blob/master/bin/build-openapi-yaml.rb)

## License

The code is available as open source under the terms of the [Apache v2.0 License](https://opensource.org/licenses/Apache-2.0).
