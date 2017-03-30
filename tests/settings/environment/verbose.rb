require_relative '../../test_init'

context "Settings" do
  context "Environment"do
    context "Verbose" do
      context "Activated" do
        receiver = OpenStruct.new

        set = TestBench::Settings::Environment::Set.new receiver
        set.env = { 'TEST_BENCH_VERBOSE' => 'on' }

        set.()

        test "True" do
          assert receiver.verbose == true
        end
      end

      context "Not set" do
        receiver = OpenStruct.new

        set = TestBench::Settings::Environment::Set.new receiver
        set.env = {  }

        set.()

        test "Nil" do
          assert receiver.verbose == nil
        end
      end
    end
  end
end
