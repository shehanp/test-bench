require_relative '../../test_init'

context "Output" do
  context "Handle" do
    context "Context Entered" do
      context do
        handle = Controls::Output::Handle.example

        write = Controls::Output::Write.configure handle, indentation: 0

        event = Controls::Event.context_entered
        handle.(event)

        test "Indentation is increased" do
          assert write.indentation == 1
        end

        test "Specialized handler is executed" do
          assert handle.handled_context_entered?
        end
      end

      context "No prose" do
        handle = Controls::Output::Handle.example

        write = Controls::Output::Write.configure handle, indentation: 0

        event = Controls::Event.context_entered prose: :none
        handle.(event)

        test "Indentation is unchanged" do
          assert write.indentation == 0
        end

        test "Specialized handler is executed" do
          assert handle.handled_context_entered?
        end
      end

      context "Silent output level" do
        handle = Controls::Output::Handle.example

        write = Controls::Output::Write.configure handle, indentation: 0, output_level: :silent

        event = Controls::Event.context_entered
        handle.(event)

        test "Indentation is unchanged" do
          assert write.indentation == 0
        end

        test "Specialized handler is executed" do
          assert handle.handled_context_entered?
        end
      end
    end
  end
end
