require_relative './examples_init'

class Foo
  def raise_an_error error_class=nil
    error_class ||= CustomError
    raise error_class
  end

  CustomError = Class.new StandardError

  module Assertions
    include TestBench::Assert::Error

    def raises_any_error? &block
      error? do
        block.()
      end
    end

    def raises_specific_error? error_class, &block
      error? error_class do
        block.()
      end
    end
  end
end

foo = Foo.new

assert foo do
  error? do
    raise_an_error
  end
end

assert foo do
  error? Foo::CustomError do
    raise_an_error
  end
end

assert foo do
  raises_any_error? do
    raise_an_error
  end
end

assert foo do
  raises_specific_error? Foo::CustomError do
    raise_an_error
  end
end
