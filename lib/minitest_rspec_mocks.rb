require 'minitest/autorun'
require 'rspec/mocks'

class Object
  # remove MiniTest's stub method so RSpec's version on BasicObject will work
  if self.method_defined?(:stub) && !defined?(removed_minitest)
    remove_method :stub
    removed_minitest = true
  end
end

module MinitestRSpecMocks
  VERSION = "0.0.1"
  
  def before_setup
    ::RSpec::Mocks.setup(self)
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