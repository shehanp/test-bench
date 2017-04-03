require_relative '../../../test_init'

context "Output" do
  context "Test" do
    context "Passed" do
      context "No Prose" do
        event = TestBench::Run::Event::Test::Passed.new

        output = TestBench::Output.new

        output.output_device = output_device = StringIO.new

        output.handle event

        test "'Test' is written" do
          assert output_device.string == "Test\n"
        end
      end
    end
  end
end