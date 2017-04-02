require_relative '../../test_init'

context "Settings" do
  context "Environment"do
    context "Logger" do
      context "Activated" do
        receiver = OpenStruct.new

        set = TestBench::Settings::Environment::Set.new receiver
        set.env = { 'TEST_BENCH_LOGGER' => 'on' }

        set.()

        test "True" do
          assert receiver.logger == true
        end
      end

      context "Not set" do
        receiver = OpenStruct.new

        set = TestBench::Settings::Environment::Set.new receiver
        set.env = {  }

        set.()

        test "Nil" do
          assert receiver.logger == nil
        end
      end
    end
  end
end
