Grape::OAuth2.configure do |config|
	config.access_token_lifetime = nil

	config.allowed_grant_types = %w(password client_credentials refresh_token)

  # Classes for OAuth2 Roles
  config.client_class_name = 'Application'
  config.access_token_class_name = 'AccessToken'
  config.resource_owner_class_name = 'User'
end