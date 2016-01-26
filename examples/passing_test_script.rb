require_relative './examples_init'

def logger
  @logger ||= ExtendedLogger::Logger.new nil
end

test 'Test Outside Context' do
end

context 'Some Context' do
  context 'Nested Context' do
    test 'Passing Test' do
    end

    test 'Other Passing Test' do
    end
  end
end

context 'Some Context' do
  logger.info 'Application log message'

  context 'Nested Context' do
    logger.info 'Application log message'

    test 'Passing Test' do
      logger.info 'Application log message'
      assert true
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
