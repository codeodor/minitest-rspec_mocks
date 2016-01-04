require 'minitest/mock'
require 'rspec/mocks'
require_relative './rspec_mocks/version'

class Object
  # remove Minitest's stub method so RSpec's version on BasicObject will work
  if self.method_defined?(:stub) && !defined?(removed_minitest_stub)
    remove_method :stub
    removed_minitest_stub = true
    removed_minitest_stub
  end
end

class Minitest::Spec
  module DSL
    module InstanceMethods
      # remove Minitest's stub method so RSpec's version on BasicObject will work
      if self.method_defined?(:expect) && !defined?(removed_minitest_expect)
        remove_method :expect
        removed_minitest_expect = true
        removed_minitest_expect
      end
    end
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
