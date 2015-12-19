require_relative '../test_init'

logger.opt_trace "Sleeping (File: #{__FILE__.inspect})"

sleep 0.5

logger.opt_debug "Slept (File: #{__FILE__.inspect})"
