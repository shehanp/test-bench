require_relative '../../../test_init'

context "Output" do
  context "Test" do
    context "Started" do
      context "No Prose" do
        event = TestBench::Run::Event::TestStarted.new

        output = TestBench::Output.new
        output.output_level = :verbose

        output.output_device = output_device = StringIO.new

        output.handle event

        test "'Test' is written" do
          assert output_device.string == "Test\n"
        end

        test "Indentation is increased" do
          assert output.indentation == 1
        end
      end
    end
  end
end

