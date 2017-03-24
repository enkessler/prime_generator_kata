SimpleCov.start do
  root File.dirname(__FILE__)

  # Don't calculate code coverage of test code
  add_filter '/test/'
end
