require_relative '../../../test_init'

context "Output" do
  context "Structure" do
    context "Context Exited" do
      context "Outer Context" do
        context do
          handle = TestBench::Output::Structure.new

          device = StringIO.new

          write = Controls::Output::Write.configure handle, device: device, indentation: 1

          event = Controls::Event.context_exited
          handle.(event)

          test "Indentation is decreased" do
            assert write.indentation == 0
          end

          test "Blank line is written" do
            assert device.string == "\n"
          end
        end

        context "Silent output level" do
          handle = TestBench::Output::Structure.new
          handle.output_level = :silent

          device = StringIO.new

          write = Controls::Output::Write.configure handle, device: device, indentation: 0

          event = Controls::Event.context_exited
          handle.(event)

          assert write.indentation == 0

          test "Nothing is written" do
            assert device.string == ''
          end
        end
      end
    end
  end
end
