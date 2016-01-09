require_relative './test_init'

class Foo
  attr_accessor :logger
end

foo = Foo.new
ExtendedLogger.configure foo
foo.logger.focus 'Should hide with -qqqq'
foo.logger.fail 'Should hide with -qqq'
foo.logger.pass 'Should hide with -qq'
foo.logger.info 'Should hide with -q'
foo.logger.debug 'Should show up with -v'
foo.logger.trace 'Should show up with -vv'
foo.logger.data 'Should show up with -vvv'
foo.logger.opt_debug 'Should show up with -vvvv'
