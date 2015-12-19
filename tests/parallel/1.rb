require_relative '../test_init'

logger.opt_trace "Sleeping (File: #{__FILE__.inspect})"

sleep 0.5 unless ENV['NO_SLEEP'] == 'on'

logger.opt_debug "Slept (File: #{__FILE__.inspect})"
