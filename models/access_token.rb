# AccessToken model
class AccessToken < ActiveRecord::Base
  include Grape::OAuth2::ActiveRecord::AccessToken
end
