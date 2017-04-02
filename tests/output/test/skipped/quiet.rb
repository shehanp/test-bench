require_relative '../../../test_init'

context "Output" do
  context "Test" do
    context "Skipped" do
      context "Quiet output level" do
        event = TestBench::Run::Event::Test::Skipped.new 'Some test'

        output = TestBench::Output.new
        output.output_level = :quiet

        output.output_device = output_device = StringIO.new

        output.handle event

        test "Nothing is written" do
          assert output_device.string == ''
        end
      end
    end
  end
end
