require_relative '../../test_init'

context "Structure" do
  context "Test" do
    context "Passed" do
      structure = Controls::Structure.example

      structure.instance_eval <<~RUBY, 'some/file.rb', 11
        test "Some test" do
        end
      RUBY

      test "Started event is published" do
        event = Controls::Event.test_started

        assert structure.published?(event)
      end

      test "Passed event is published" do
        event = Controls::Event.test_passed

        assert structure.published?(event)
      end

      test "Finished event is published" do
        event = Controls::Event.test_finished

        assert structure.published?(event)
      end

      test "Failed event is not published" do
        refute structure.published?(TestBench::Event::TestFailed)
      end

      test "Skipped event is not published" do
        refute structure.published?(TestBench::Event::TestSkipped)
      end
    end
  end
end
