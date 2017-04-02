require_relative '../../test_init'

context "Structure" do
  context "Test" do
    context "Passed" do
      structure = TestBench::Structure::Example.build

      structure.instance_exec do
        test "Some test" do
        end
      end

      test "Started event is published" do
        event = TestBench::Run::Event::Test::Started.new 'Some test'

        assert structure.published?(event)
      end

      test "Passed event is published" do
        event = TestBench::Run::Event::Test::Passed.new 'Some test'

        assert structure.published?(event)
      end

      test "Finished event is published" do
        event = TestBench::Run::Event::Test::Finished.new 'Some test'

        assert structure.published?(event)
      end

      test "Failed event is not published" do
        refute structure.published?(TestBench::Run::Event::Test::Failed)
      end

      test "Skipped event is not published" do
        refute structure.published?(TestBench::Run::Event::Test::Skipped)
      end
    end
  end
end
