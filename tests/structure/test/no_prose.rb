require_relative '../../test_init'

context "Structure" do
  context "Test" do
    context "No prose" do
      context "Pass" do
        structure = TestBench::Structure::Example.build

        structure.instance_exec do
          test do
          end
        end

        context "Started event" do
          event = TestBench::Run::Event::Test::Started.new nil

          test "Prose is nil" do
            assert structure.published?(event)
          end
        end

        context "Passed event" do
          event = TestBench::Run::Event::Test::Passed.new nil

          test "Prose is nil" do
            assert structure.published?(event)
          end
        end

        context "Finished event" do
          event = TestBench::Run::Event::Test::Finished.new nil

          test "Prose is nil" do
            assert structure.published?(event)
          end
        end
      end

      context "Fail" do
        structure = TestBench::Structure::Example.build

        error = RuntimeError.new

        structure.instance_exec do
          test do
            raise error
          end
        end

        context "Failed event" do
          event = TestBench::Run::Event::Test::Failed.new nil, error

          test "Prose is nil" do
            assert structure.published?(event)
          end
        end
      end

      context "Skip" do
        structure = TestBench::Structure::Example.build

        structure.instance_exec do
          test
        end

        context "Failed event" do
          event = TestBench::Run::Event::Test::Skipped.new nil

          test "Prose is nil" do
            assert structure.published?(event)
          end
        end
      end
    end
  end
end
