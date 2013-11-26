# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'minitest_rspec_mocks'

Gem::Specification.new do |spec|
  spec.name          = "minitest-rspec-mocks"
  spec.version       = MinitestRSpecMocks::VERSION
  spec.authors       = ["Sammy Larbi"]
  spec.email         = ["sam@codeodor.com"]
  spec.description   = %q{Use rspec-mocks with minitest. A description of what this does doesn't get longer than that.}
  spec.summary       = %q{Use rspec-mocks with minitest}
  spec.homepage      = "https://github.com/codeodor/minitest_rspec_mocks"
  spec.license       = "MIT"

  spec.files         = ["lib/minitest_rspec_mocks.rb"]
  spec.executables   = []
  spec.test_files    = ["test/minitest_rspec_mocks_test.rb"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency "minitest"
  spec.add_dependency "rspec-mocks"
end
