require_relative './test_init'

context 'Logging' do
  test 'Indentation' do
    output = StringIO.new

    TestBench::Logging.configure output

    TestBench.logger.step 'Some Context'
    TestBench.logger.indent
    TestBench.logger.step 'Nested Context'
    TestBench.logger.deindent
    TestBench.logger.step 'Some Other Context'

    assert output.string == <<~TEXT
    Some Context
      Nested Context
    Some Other Context
    TEXT
  end
end
