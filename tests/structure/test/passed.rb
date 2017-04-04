require_relative '../../test_init'

context "Structure" do
  context "Test" do
    context "Passed" do
      structure = Controls::Structure.example

      structure.instance_exec do
        test "Some test" do
        end
      end

      test "Started event is published" do
        event = TestBench::Run::Event::TestStarted.new 'Some test'

        assert structure.published?(event)
      end

      test "Passed event is published" do
        event = TestBench::Run::Event::TestPassed.new 'Some test'

        assert structure.published?(event)
      end

      test "Finished event is published" do
        event = TestBench::Run::Event::TestFinished.new 'Some test'

        assert structure.published?(event)
      end

      test "Failed event is not published" do
        refute structure.published?(TestBench::Run::Event::TestFailed)
      end

      test "Skipped event is not published" do
        refute structure.published?(TestBench::Run::Event::TestSkipped)
      end
    end
  end
end
