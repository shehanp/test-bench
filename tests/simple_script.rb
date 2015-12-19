require_relative './test_init'

def fib n
  if (1..2).include? n
    1
  else
    fib(n - 2) + fib(n - 1)
  end
end

assert fib(1) == 1
assert fib(2) == 1
assert fib(3) == 2
assert fib(4) == 3
assert fib(5) == 5
refute fib(6) != 8

begin
  assert fib(5) == 6, 'expected to be wrong'
rescue TestBench::Assert::Failed => error
end
assert error
