require_relative '../../test_init'

context "Structure" do
  context "Test" do
    context "Skipped" do
      structure = Controls::Structure.example

      structure.instance_exec do
        test "Some test"
      end

      test "Started event is published" do
        event = Controls::Event.test_started

        assert structure.published?(event)
      end

      test "Skipped event is published" do
        event = Controls::Event.test_skipped

        assert structure.published?(event)
      end

      test "Passed event is not published" do
        refute structure.published?(TestBench::Event::TestPassed)
      end

      test "Finished event is not published" do
        refute structure.published?(TestBench::Event::TestFinished)
      end

      test "Failed event is not published" do
        refute structure.published?(TestBench::Event::TestFailed)
      end
    end
  end
end
