require 'bundler/setup'
require 'padrino-core/cli/rake'

require File.expand_path('../config/boot.rb', __FILE__)


PadrinoTasks.use(:database)
PadrinoTasks.use(:activerecord)
PadrinoTasks.init

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new :spec

require 'rubocop/rake_task'
RuboCop::RakeTask.new

task default: [:rubocop, :spec]
