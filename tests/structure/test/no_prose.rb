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
          event = TestBench::Run::Event::TestStarted.new nil

          test "Prose is nil" do
            assert structure.published?(event)
          end
        end

        context "Passed event" do
          event = TestBench::Run::Event::TestPassed.new nil

          test "Prose is nil" do
            assert structure.published?(event)
          end
        end

        context "Finished event" do
          event = TestBench::Run::Event::TestFinished.new nil

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
          event = TestBench::Run::Event::TestFailed.new nil, error

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
          event = TestBench::Run::Event::TestSkipped.new nil

          test "Prose is nil" do
            assert structure.published?(event)
          end
        end
      end
    end
  end
end
