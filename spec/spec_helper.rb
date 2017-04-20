require 'simplecov'
SimpleCov.start

require 'active_record'
require 'faker'
require 'factory_girl'
require 'database_cleaner'
require 'shoulda/matchers'


require 'rubygems'

ENV['RACK_ENV'] ||= 'test'

FactoryGirl.definition_file_paths = %w{./factories ./test/factories ./spec/factories}
FactoryGirl.find_definitions

DatabaseCleaner.strategy = :truncation


require 'rack/test'

require File.expand_path('../../config/boot', __FILE__)

RSpec.configure do |config|

  config.include FactoryGirl::Syntax::Methods
  config.include Shoulda::Matchers

  config.mock_with :rspec
  config.expect_with :rspec
  config.raise_errors_for_deprecations!

  config.before(:each) do
    DatabaseCleaner.clean
  end

end
