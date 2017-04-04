require_relative '../../test_init'

context "Structure" do
  context "Test" do
    context "Block Raises Error" do
      structure = Controls::Structure.example

      error = RuntimeError.new

      begin
        structure.instance_exec do
          test 'Some test' do
            raise error
          end
        end
      rescue RuntimeError => reraised_error
      end

      test "Error is not re-raised" do
        assert reraised_error.nil?
      end

      test "Failed event is published" do
        event = TestBench::Run::Event::TestFailed.new 'Some test', error

        assert structure.published?(event)
      end

      test "Error raised event is published" do
        event = TestBench::Run::Event::ErrorRaised.new error

        assert structure.published?(event)
      end

      test "Test finished event is published" do
        assert structure.published?(TestBench::Run::Event::TestFinished)
      end
    end
  end
end
