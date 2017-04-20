source 'https://rubygems.org'

ruby '2.3.1'

gem 'erubis'
gem 'grape'
gem 'bcrypt'
gem 'grape-swagger'
gem 'grape-swagger-representable'
gem 'padrino'
gem 'activerecord', '>= 3.1', :require => 'active_record'
gem 'pg'
gem 'grape_oauth2', git: 'https://github.com/nbulaj/grape_oauth2.git'

group :development, :test do
  gem 'rake'
  gem 'rubocop'
end

group :test do
  gem 'rack-test'
  gem 'rspec'
  gem 'factory_girl'
  gem 'faker'
  gem 'simplecov', require: false
  gem 'activemodel'
  gem 'shoulda-matchers', '2.8.0', require: false
  gem 'database_cleaner', '~> 1.5'
end
