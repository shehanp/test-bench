require_relative '../init'

unless TOPLEVEL_BINDING.receiver.respond_to?(:context)
  require 'test_bench/bootstrap'
  TestBench::Bootstrap.activate
end

require 'ostruct'
require 'stringio'

require 'test_bench/examples'
