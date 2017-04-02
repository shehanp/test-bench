require_relative '../../test_init'

context "Settings" do
  context "Environment"do
    context "Silent" do
      context "Activated" do
        receiver = OpenStruct.new

        set = TestBench::Settings::Environment::Set.new receiver
        set.env = { 'TEST_BENCH_SILENT' => 'on' }

        set.()

        test "True" do
          assert receiver.silent == true
        end
      end

      context "Not set" do
        receiver = OpenStruct.new

        set = TestBench::Settings::Environment::Set.new receiver
        set.env = {  }

        set.()

        test "Nil" do
          assert receiver.silent == nil
        end
      end
    end
  end
end
