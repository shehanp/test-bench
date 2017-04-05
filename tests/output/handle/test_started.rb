require_relative '../../test_init'

context "Output" do
  context "Handle" do
    context "Test Started" do
      context do
        handle = Controls::Output::Handle.example

        write = Controls::Output::Write.configure handle, indentation: 0

        event = Controls::Event.test_started
        handle.(event)

        test "Indentation is unchanged" do
          assert write.indentation == 0
        end

        test "Specialized handler is executed" do
          assert handle.handled_test_started?
        end
      end

      context "Verbose output level" do
        handle = Controls::Output::Handle.example

        write = Controls::Output::Write.configure handle, indentation: 0, output_level: :verbose

        event = Controls::Event.test_started
        handle.(event)

        test "Indentation is increased" do
          assert write.indentation == 1
        end

        test "Specialized handler is executed" do
          assert handle.handled_test_started?
        end
      end
    end
  end
end

