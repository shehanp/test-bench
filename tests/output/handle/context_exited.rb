require_relative '../../test_init'

context "Output" do
  context "Handle" do
    context "Context Exited" do
      context do
        handle = Controls::Output::Handle.example

        write = Controls::Output::Write.configure handle, indentation: 1

        event = Controls::Event.context_exited
        handle.(event)

        test "Indentation is decreased" do
          assert write.indentation == 0
        end

        test "Specialized handler is executed" do
          assert handle.handled_context_exited?
        end
      end

      context "No prose" do
        handle = Controls::Output::Handle.example

        write = Controls::Output::Write.configure handle, indentation: 1

        event = Controls::Event.context_exited prose: :none
        handle.(event)

        test "Indentation is unchanged" do
          assert write.indentation == 1
        end

        test "Specialized handler is executed" do
          assert handle.handled_context_exited?
        end
      end

      context "Silent output level" do
        handle = Controls::Output::Handle.example

        write = Controls::Output::Write.configure handle, indentation: 1, output_level: :silent

        event = Controls::Event.context_exited
        handle.(event)

        test "Indentation is unchanged" do
          assert write.indentation == 1
        end

        test "Specialized handler is executed" do
          assert handle.handled_context_exited?
        end
      end
    end
  end
end
