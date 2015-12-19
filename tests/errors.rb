require_relative './test_init'

def foo
  bar
end

def bar
  baz
end

def baz
  qux
end

def qux
  fail 'Error' if ENV['TEST_ERROR'] == 'on'
end

foo
