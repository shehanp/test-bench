require_relative '../../../test_init'

context "Output" do
  context "Structure" do
    context "Test Started" do
      context "Verbose output level" do
        structure = TestBench::Output::Structure.new
        structure.output_level = :verbose

        device = StringIO.new

        write = Controls::Output::Write.configure structure, device: device, indentation: 0

        event = Controls::Event.test_started

        structure.(event)

        test "Prose is written" do
          assert device.string == "Some test\n"
        end

        test "Indentation is increased" do
          assert write.indentation == 1
        end
      end
    end
  end
end
