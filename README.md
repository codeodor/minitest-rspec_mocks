minitest-rspec-mocks
====================

Monkeypatches to have minitest work with rspec-mocks

Why?
----
If you use minitest/autorun, it patches its `stub` method onto `Object`. RSpec puts its version on `BasicObject` so it being further up the ancestor chain, it will rarely be used.
  
Also there is a little bit of setup / teardown you need to do a la http://myronmars.to/n/dev-blog/2012/07/mixing-and-matching-parts-of-rspec 

Install: 
----
`gem "minitest_rspec_mocks"` in your Gemfile

Run the tests: 
----
`git clone` this repository, then cd into it and run `ruby test/minitest_rspec_mocks_test.rb`


