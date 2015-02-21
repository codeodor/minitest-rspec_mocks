source 'https://rubygems.org'

# Specify your gem's dependencies in minitest-rspec-mocks.gemspec
gemspec
#gem "rspec-support", :git => "https://github.com/rspec/rspec-support.git", :require => false
#gem "rspec-mocks", :git => "https://github.com/rspec/rspec-mocks.git"
#gem "minitest", "5.2.1"

if ENV['RSPEC_VERSION']
  gem 'rspec-mocks', "~> #{ENV['RSPEC_VERSION']}"
end

if ENV['MINITEST_VERSION']
  gem 'minitest', "~> #{ENV['MINITEST_VERSION']}"
end
