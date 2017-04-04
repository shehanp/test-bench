require_relative '../../test_init'

context "Structure" do
  context "Test" do
    context "Skipped" do
      structure = Controls::Structure.example

      structure.instance_exec do
        test "Some test"
      end

      test "Started event is published" do
        event = TestBench::Run::Event::TestStarted.new 'Some test'

        assert structure.published?(event)
      end

      test "Skipped event is published" do
        event = TestBench::Run::Event::TestSkipped.new 'Some test'

        assert structure.published?(event)
      end

      test "Passed event is not published" do
        refute structure.published?(TestBench::Run::Event::TestPassed)
      end

      test "Finished event is not published" do
        refute structure.published?(TestBench::Run::Event::TestFinished)
      end

      test "Failed event is not published" do
        refute structure.published?(TestBench::Run::Event::TestFailed)
      end
    end
  end
end
