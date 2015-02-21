gem 'minitest'
require_relative '../../lib/minitest/rspec_mocks'
require "minitest/autorun"

base_class = if MiniTest.const_defined?(:Unit)
               MiniTest::Unit::TestCase
             else
               Minitest::Test
             end

# I am not sure how/if this test ever passed. We remove minitest stub 
# when we require minitest_spec_mocks, so it doesn't make sense to 
# have this test. 
#
# class MiniTestWithoutRspecMocksTest < MiniTest::Unit::TestCase
#   def test_it_should_use_minitest_stub
#     string = "hello"
#     string.stub(:to_i, 100) do
#       assert string.to_i == 100
#     end
#   end
# end

class MiniTestWithRspecMocksShouldStyleTest < base_class
  include MiniTest::RSpecMocks
  def test_it_should_use_rspec_stub
    RSpec::Mocks.configuration.syntax = :should
    string = "hello"
    assert string.to_i == 0
    string.stub(to_i: 100)
    assert string.to_i == 100
  end
end

class MiniTestWithRspecMocksExpectStyleTest < base_class
  include MiniTest::RSpecMocks
  def test_it_should_use_rspec_expect
    RSpec::Mocks.configuration.syntax = :expect
    string = "hello"
    assert string.to_i == 0
    expect(string).to receive(:to_i).and_return 100
    assert string.to_i == 100
  end
end
