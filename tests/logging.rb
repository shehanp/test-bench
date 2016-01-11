require_relative './test_init'

context 'Logging' do
  test 'Indentation' do
    output = StringIO.new

    TestBench::Logging.configure output

    extend TestBench::Logging

    logger.heading 'Some Context'
    logger.indent
    logger.heading 'Nested Context'
    logger.deindent
    logger.heading 'Some Other Context'

    assert output.string == <<~TEXT
    Some Context
      Nested Context
    Some Other Context
    TEXT
  end
end
