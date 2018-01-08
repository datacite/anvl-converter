require 'bundler/setup'
Bundler.setup

require 'simplecov'
SimpleCov.start

require 'anvl'
require 'rspec'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
