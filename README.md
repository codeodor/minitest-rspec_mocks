minitest-rspec_mocks
====================
[![Build Status](https://travis-ci.org/codeodor/minitest-rspec_mocks.svg)](https://travis-ci.org/codeodor/minitest-rspec_mocks)

Monkeypatches to have minitest work with rspec-mocks. Note the name changed from `minitest_rspec_mocks` to `minitest-rspec_mocks` for consistency with the idea that this is a plugin for minitest.

Use it:
------
`include Minitest::RSpecMocks` in whichever test case base classes you want
rspec-mocks to be available. For example, if you're in a Rails project that
uses minitest and you want rspec-mocks everywhere, you might do:

```ruby
class ActiveSupport::TestCase
  include Minitest::RSpecMocks
end

class TestSomething < ActiveSupport::TestCase
  def test_it_should_use_rspec_stub
    RSpec::Mocks.configuration.syntax = :should
    string = "hello"
    assert string.to_i == 0
    string.stub(to_i: 100)
    assert string.to_i == 100
  end

  def test_it_should_use_rspec_expect
    RSpec::Mocks.configuration.syntax = :expect
    string = "hello"
    assert string.to_i == 0
    expect(string).to receive(:to_i).and_return 100
    assert string.to_i == 100
  end
end
```

Note that you must include it in a base class for your tests. Including it in
the test class itself will not work.

Note that RSpec 3 deprecates the `object.should` (where you use `object.stub(to_i: 100)`) style in favor of using the `expect` style syntax.

Why?
----
If you use minitest/autorun, it patches its `stub` method onto `Object`. RSpec puts its version on `BasicObject` so it being further up the ancestor chain, it will rarely be used.
  
Also there is a little bit of setup / teardown you need to do a la http://myronmars.to/n/dev-blog/2012/07/mixing-and-matching-parts-of-rspec 

Install: 
----
`gem "minitest-rspec_mocks"` in your Gemfile

Run the tests: 
----
`git clone` this repository, then cd into it and run `bundle exec ruby test/minitest/rspec_mocks_test.rb`


