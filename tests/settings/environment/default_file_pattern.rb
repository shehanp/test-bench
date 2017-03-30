require_relative '../../test_init'

context "Settings" do
  context "Environment"do
    context "Default File Pattern" do
      context "Specified" do
        receiver = OpenStruct.new

        pattern = 'some-pattern'

        set = TestBench::Settings::Environment::Set.new receiver
        set.env = { 'TEST_BENCH_DEFAULT_FILE_PATTERN' => pattern }

        set.()

        test "Set" do
          assert receiver.default_file_pattern == pattern
        end
      end

      context "Not specified" do
        receiver = OpenStruct.new

        set = TestBench::Settings::Environment::Set.new receiver
        set.env = {  }

        set.()

        test "Nil" do
          assert receiver.default_file_pattern == nil
        end
      end
    end
  end
end
