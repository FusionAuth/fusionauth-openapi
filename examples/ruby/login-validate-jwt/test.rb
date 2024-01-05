# Load the gem 
require 'openapi_client'

# Setup authorization
OpenapiClient.configure do |config|
  # Configure API key authorization: ApiKeyAuth
  config.api_key['ApiKeyAuth'] = 'PUT_IN_CORRECT_API_KEY'
  config.host = 'sandbox.fusionauth.io' # or other host
  config.scheme = 'https' # if you'll be running over SSL
  #config.debugging = true # uncomment for more logging
end

api_instance = OpenapiClient::DefaultApi.new
#opts = { 
#action_request: OpenapiClient::ActionRequest.new # ActionRequest | 
#}

begin

  login = OpenapiClient::LoginRequest.new(
    login_id: 'sandbox@fusionauth.io',
    password: 'PUT_IN_REAL_PASSWORD'
  )
  opts = { 
    login_request: login,
    x_fusion_auth_tenant_id: 'bafb4319-b7ca-ed27-fa2f-bbdba9d8ec06'
  }
  result = api_instance.login_with_id(opts)

  # have to set access token dynamically
  api_instance.api_client.config.access_token = result.token

  jwt_opts = { 
    x_fusion_auth_tenant_id: 'bafb4319-b7ca-ed27-fa2f-bbdba9d8ec06'
  }
  result = api_instance.validate_jwt_with_id(jwt_opts)
  p result.jwt.jti
 
  # do it again
  result2 = api_instance.login_with_id(opts)

  api_instance.api_client.config.access_token = result2.token

  result3 = api_instance.validate_jwt_with_id(jwt_opts)
  p result3.jwt.jti
rescue OpenapiClient::ApiError => e
  puts "Exception when testing validate_jwt_with_id: #{e}"
end

