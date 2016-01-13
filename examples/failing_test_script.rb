require_relative './examples_init'

TestBench.activate

def logger
  @logger ||= ExtendedLogger::Logger.new nil
end

test 'Test Outside Context'

context 'Some Context' do
  logger.info 'Application log message'

  context 'Nested Context' do
    logger.info 'Application log message'

    test 'Passing Test' do
      logger.info 'Application log message'
      assert true
    end

    test 'Failing Test' do
      logger.info 'Application log message'
      refute true
    end

    test 'Second Failing Test' do
      logger.info 'Application log message'
      refute true
    end

    test 'Erroring Test' do
      fail
    end

    test 'Pending Test'

    test do assert true end
    test do assert true end
    test do assert true end
  end
  logger.info 'Application log message'

  context

  context 'Pending Context'
  logger.info 'Application log message'
end
