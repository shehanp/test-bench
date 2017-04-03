require_relative '../../../test_init'

context "Output" do
  context "Context" do
    context "Entered" do
      context "Silent output level" do
        event = TestBench::Run::Event::Context::Entered.new 'Some context'

        output = TestBench::Output.new

        output.output_level = :silent
        output.output_device = output_device = StringIO.new

        output.handle event

        test "Nothing is written" do
          assert output_device.string == ''
        end

        test "Indentation is unchanged" do
          assert output.indentation == 0
        end
      end
    end
  end
end
