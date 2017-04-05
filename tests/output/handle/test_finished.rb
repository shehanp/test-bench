require_relative '../../test_init'

context "Output" do
  context "Handle" do
    context "Test Finished" do
      context do
        handle = Controls::Output::Handle.example

        write = Controls::Output::Write.configure handle, indentation: 1

        event = Controls::Event.test_finished
        handle.(event)

        test "Indentation is unchanged" do
          assert write.indentation == 1
        end

        test "Specialized handler is executed" do
          assert handle.handled_test_finished?
        end
      end

      context "Verbose output level" do
        handle = Controls::Output::Handle.example

        write = Controls::Output::Write.configure handle, indentation: 1, output_level: :verbose

        event = Controls::Event.test_finished
        handle.(event)

        test "Indentation is decreased" do
          assert write.indentation == 0
        end

        test "Specialized handler is executed" do
          assert handle.handled_test_finished?
        end
      end
    end
  end
end

