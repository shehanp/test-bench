require_relative '../../test_init'

context "Settings" do
  context "Environment"do
    context "Reverse backtraces" do
      context "Activated" do
        receiver = OpenStruct.new

        set = TestBench::Settings::Environment::Set.new receiver
        set.env = { 'TEST_BENCH_REVERSE_BACKTRACES' => 'on' }

        set.()

        test "True" do
          assert receiver.reverse_backtraces == true
        end
      end

      context "Not set" do
        receiver = OpenStruct.new

        set = TestBench::Settings::Environment::Set.new receiver
        set.env = {  }

        set.()

        test "Nil" do
          assert receiver.reverse_backtraces == nil
        end
      end
    end
  end
end
