gem 'minitest'
require_relative '../lib/minitest_rspec_mocks'
require "minitest/autorun"
class MinitestWithoutRspecMocksTest < MiniTest::Unit::TestCase
  def test_it_should_use_minitest_stub
    string = "hello"
    string.stub(:to_i, 100) do
      assert string.to_i == 100
    end
  end
end

class MinitestWithRspecMocksTest < MiniTest::Unit::TestCase
  include MinitestRSpecMocks
  def test_it_should_use_rspec_stub
    string = "hello"
    assert string.to_i == 0
    string.stub(to_i: 100)
    assert string.to_i == 100
  end
end

