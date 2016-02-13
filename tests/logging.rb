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

    assert output.string == <<-TEXT
    \e[0;32mSome Context\e[0m
      \e[0;32mNested Context\e[0m
    \e[0;32mSome Other Context\e[0m
    TEXT
  end
end
