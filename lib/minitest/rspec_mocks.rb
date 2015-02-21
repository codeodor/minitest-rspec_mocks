require 'minitest/autorun'
require 'rspec/mocks'
require_relative './rspec_mocks/version'

class Object
  # remove Minitest's stub method so RSpec's version on BasicObject will work
  if self.method_defined?(:stub) && !defined?(removed_minitest)
    remove_method :stub
    removed_minitest = true
  end
end

module Minitest
  module RSpecMocks
    include RSpec::Mocks::ExampleMethods unless ::RSpec::Mocks::Version::STRING < "3"
    def before_setup
      if ::RSpec::Mocks::Version::STRING < "3"
        ::RSpec::Mocks.setup(self)
      else
        ::RSpec::Mocks.setup
      end
      super
    end

    def after_teardown
      begin
        ::RSpec::Mocks.verify
      ensure
        ::RSpec::Mocks.teardown
      end
      super
    end
  end
end
