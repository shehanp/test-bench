require_relative '../../../test_init'

context "Output" do
  context "Structure" do
    context "Test Started" do
      context "Verbose output level" do
        handle = TestBench::Output::Handlers::Structure.new

        device = StringIO.new

        write = Controls::Output::Write.configure(
          handle,
          device: device,
          output_level: :verbose,
          indentation: 0
        )

        event = Controls::Event.test_started

        handle.(event)

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
