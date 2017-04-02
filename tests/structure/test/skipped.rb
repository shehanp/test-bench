require_relative '../../test_init'

context "Structure" do
  context "Test" do
    context "Skipped" do
      structure = TestBench::Structure::Example.build

      structure.instance_exec do
        test "Some test"
      end

      test "Started event is published" do
        event = TestBench::Run::Event::Test::Started.new 'Some test'

        assert structure.published?(event)
      end

      test "Skipped event is published" do
        event = TestBench::Run::Event::Test::Skipped.new 'Some test'

        assert structure.published?(event)
      end

      test "Passed event is not published" do
        refute structure.published?(TestBench::Run::Event::Test::Passed)
      end

      test "Finished event is not published" do
        refute structure.published?(TestBench::Run::Event::Test::Finished)
      end

      test "Failed event is not published" do
        refute structure.published?(TestBench::Run::Event::Test::Failed)
      end
    end
  end
end
