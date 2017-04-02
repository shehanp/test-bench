require_relative '../../../test_init'

context "Output" do
  context "Context" do
    context "Exited" do
      context "Quiet output level" do
        event = TestBench::Run::Event::Context::Exited.new 'Some context'

        output = TestBench::Output.new
        output.indentation = 1
        output.output_level = :quiet

        output.output_device = output_device = StringIO.new

        output.handle event

        test "Indentation is unchanged" do
          assert output.indentation == 1
        end
      end
    end
  end
end
