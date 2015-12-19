require 'extended_logger'
require 'optparse'

require 'test_bench/assert'
require 'test_bench/check_result'
require 'test_bench/cli'
require 'test_bench/cli/options'
require 'test_bench/cli/runner'
require 'test_bench/cli/process_set'
require 'test_bench/cli/process_set/process'
require 'test_bench/logging'
require 'test_bench/spec_dsl'
require 'test_bench/test_bench'

module TestBench
  def self.root!
    File.expand_path '..', __FILE__
  end
end
