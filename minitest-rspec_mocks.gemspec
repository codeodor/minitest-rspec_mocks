# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'minitest/rspec_mocks/version'

Gem::Specification.new do |spec|
  spec.name          = "minitest-rspec_mocks"
  spec.version       = MiniTest::RSpecMocks::VERSION
  spec.authors       = ["Sammy Larbi"]
  spec.email         = ["sam@codeodor.com"]
  spec.description   = %q{Use rspec-mocks with minitest. A description of what this does doesn't get longer than that.}
  spec.summary       = %q{Use rspec-mocks with minitest}
  spec.homepage      = "https://github.com/codeodor/minitest-rspec_mocks"
  spec.license       = "MIT"

  spec.files         = ["lib/minitest/rspec_mocks.rb", "lib/minitest/rspec_mocks/version.rb"]
  spec.executables   = []
  spec.test_files    = ["test/minitest/rspec_mocks_test.rb"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.1.0"
  spec.add_development_dependency "rake"
  spec.add_dependency "minitest", ">= 4.0", "< 5.99"
  spec.add_dependency "rspec-mocks", ">= 2.14", "< 3.99"
end
