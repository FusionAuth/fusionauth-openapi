## FusionAuth OpenAPI

This is an **experimental** OpenAPI specification for the FusionAuth API.

It can be used in a variety of contexts, including generating client libraries, tracking API changes over time and testing. More here: https://openapi.tools/

Use this file to do all your OpenAPI related actions. For additional information and documentation on FusionAuth refer to [https://fusionauth.io](https://fusionauth.io).

## Known issues

* FusionAuth uses polymorphic responses for some API calls, particularly Identity Provider. The support for that in client library generation code is problematic, based on our testing.
* This spec is built using the [fusionauth-client-builder](https://github.com/fusionauth/fusionauth-client-builder) project JSON files. This covers almost all of the API, but not everything. A few things are missing. If you find one that you need, please open a bug report.
* OAuth grant actions aren't currently supported (the /oauth2/ endpoints).

## Next steps

We are putting this out to see how useful the FusionAuth community finds it. We welcome feedback on your usage of this spec.

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
