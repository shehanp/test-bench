require_relative '../../test_init'

context "Settings" do
  context "Environment"do
    context "Abort on error" do
      context "Activated" do
        receiver = OpenStruct.new

        set = TestBench::Settings::Environment::Set.new receiver
        set.env = { 'TEST_BENCH_ABORT_ON_ERROR' => 'on' }

        set.()

        test "True" do
          assert receiver.abort_on_error == true
        end
      end

      context "Not set" do
        receiver = OpenStruct.new

        set = TestBench::Settings::Environment::Set.new receiver
        set.env = {  }

        set.()

        test "Nil" do
          assert receiver.abort_on_error == nil
        end
      end
    end
  end
end
