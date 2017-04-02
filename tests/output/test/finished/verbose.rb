require_relative '../../../test_init'

context "Output" do
  context "Test" do
    context "Finished" do
      event = TestBench::Run::Event::Test::Finished.new 'Some test'

      output = TestBench::Output.new
      output.output_level = :verbose
      output.indentation = 1

      output.handle event

      test "Indentation is decreased" do
        assert output.indentation == 0
      end
    end
  end
end
