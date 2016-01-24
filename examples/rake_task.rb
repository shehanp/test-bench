require_relative 'examples_init'

# This is obviously not a real rake task, but it shows what you might put inside
# one to run your test suite for you.

def task *, &block
  block.()
end

task :spec do
  require 'test_bench'
  TestBench.activate

  # Exclude this file
  exclude_pattern = /#{Regexp.escape __FILE__}/
  result = TestBench::Runner.('examples', :exclude_pattern => exclude_pattern)
  exit 1 unless result
end
