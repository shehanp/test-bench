require_relative './test_init'

log_output = StringIO.new
TestBench::Logging.configure log_output

context 'Some Context' do
  context 'Nested Context' do
    context do
      test 'Actual Test' do
        assert true do
          __logger.data "some\ndata"
          true
        end
      end

      test 'Pending Test'
    end
  end
end

expected_output = <<-TEXT
Some Context
  Nested Context
    Actual Test
      some\\n
      data
      Assertion passed (Target: true)
    Pending Test
\\n
TEXT

assert log_output.string == expected_output
