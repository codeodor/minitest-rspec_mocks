gem 'minitest'
require_relative '../../lib/minitest/rspec_mocks'
require "minitest/autorun"

base_class = if MiniTest.const_defined?(:Unit)
               MiniTest::Unit::TestCase
             else
               Minitest::Test
             end

base_class.send :include, Minitest::RSpecMocks

class MiniTestWithRspecMocksShouldStyleTest < base_class
  def test_it_should_use_rspec_stub
    RSpec::Mocks.configuration.syntax = :should
    string = "hello"
    assert string.to_i == 0
    string.stub(to_i: 100)
    assert string.to_i == 100
  end
end

class MiniTestWithRspecMocksExpectStyleTest < base_class
  def test_it_should_use_rspec_expect
    RSpec::Mocks.configuration.syntax = :expect
    string = "hello"
    assert string.to_i == 0
    expect(string).to receive(:to_i).and_return 100
    assert string.to_i == 100
  end
end

describe 'when used with minitest/spec syntax' do
  it 'works with stub syntax' do
    RSpec::Mocks.configuration.syntax = :should
    string = "hello"
    assert string.to_i == 0
    string.stub(to_i: 100)
    assert string.to_i == 100
  end

  it 'works with expect syntax' do
    RSpec::Mocks.configuration.syntax = :expect
    string = "hello"
    assert string.to_i == 0
    expect(string).to receive(:to_i).and_return 100
    assert string.to_i == 100
  end
end
