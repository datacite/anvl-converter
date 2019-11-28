require "date"
require File.expand_path("../lib/anvl/version", __FILE__)

Gem::Specification.new do |s|
  s.authors       = "Martin Fenner"
  s.email         = "mfenner@datacite.org"
  s.name          = "anvl-converter"
  s.homepage      = "https://github.com/datacite/anvl-converter"
  s.summary       = "Ruby library to parse and generate ANVL"
  s.date          = Date.today
  s.description   = "Ruby library to parse and generate A Name-Value Language (ANVL)."
  s.require_paths = ["lib"]
  s.version       = Anvl::VERSION
  s.extra_rdoc_files = ["README.md"]
  s.license       = 'MIT'

  s.require_paths = ["lib"]
  s.files       = `git ls-files`.split($/)
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")

  # Declary dependencies here, rather than in the Gemfile
  s.add_development_dependency 'bundler', '~> 1.0'
  s.add_development_dependency 'rspec', '~> 3.4'
  s.add_development_dependency 'rake', '~> 12.0'
  s.add_dependency 'activesupport', '>= 4.2.5', '< 6'
  s.add_development_dependency 'codeclimate-test-reporter', '~> 1.0', '>= 1.0.8'
  s.add_development_dependency 'simplecov'
end
