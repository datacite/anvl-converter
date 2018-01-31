require 'bundler/setup'
Bundler.setup

require 'simplecov'
SimpleCov.start

require 'anvl'
require 'rspec'

def fixture_path
  File.expand_path("../fixtures", __FILE__) + '/'
end

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
