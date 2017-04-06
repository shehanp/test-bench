require_relative '../../test_init'

context "Structure" do
  context "Context" do
    context "Block Raises Error" do
      structure = Controls::Structure.example

      error = RuntimeError.new

      begin
        structure.instance_exec do
          context do
            raise error
          end
        end
      rescue RuntimeError => reraised_error
      end

      test "Error is not re-raised" do
        assert reraised_error.nil?
      end

      test "Error raised event is published" do
        event = Controls::Event.error_raised error: error

        assert structure.published?(event)
      end

      test "Context exited event is published" do
        assert structure.published?(TestBench::Run::Event::ContextExited)
      end
    end
  end
end
