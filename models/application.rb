# Application model
class Application < ActiveRecord::Base
  include Grape::OAuth2::ActiveRecord::Client
end
