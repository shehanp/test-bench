require_relative './examples_init'

def some_algorithm number
  (number ** 2) + 1
end

assert some_algorithm(2) == 5
assert some_algorithm(3) == 10
assert some_algorithm(4) == 17
