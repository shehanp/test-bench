require_relative '../../test_init'

context "Structure" do
  context "Test" do
    context "No prose" do
      context "Pass" do
        structure = Controls::Structure.example

        structure.instance_exec do
          test do
          end
        end

        context "Started event" do
          event = Controls::Event.test_started prose: :none

          test "Prose is nil" do
            assert structure.published?(event)
          end
        end

        context "Passed event" do
          event = Controls::Event.test_passed prose: :none

          test "Prose is nil" do
            assert structure.published?(event)
          end
        end

        context "Finished event" do
          event = Controls::Event.test_finished prose: :none

          test "Prose is nil" do
            assert structure.published?(event)
          end
        end
      end

      context "Fail" do
        structure = Controls::Structure.example

        error = RuntimeError.new

        structure.instance_exec do
          test do
            raise error
          end
        end

        context "Failed event" do
          event = Controls::Event.test_failed prose: :none, error: error

          test "Prose is nil" do
            assert structure.published?(event)
          end
        end
      end

      context "Skip" do
        structure = Controls::Structure.example

        structure.instance_exec do
          test
        end

        context "Failed event" do
          event = Controls::Event.test_skipped prose: :none

          test "Prose is nil" do
            assert structure.published?(event)
          end
        end
      end
    end
  end
end
