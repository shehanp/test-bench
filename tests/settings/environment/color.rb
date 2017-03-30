require_relative '../../test_init'

context "Settings" do
  context "Environment"do
    context "Color" do
      context "Output device is an interactive terminal" do
        output_device = $stdout
        assert output_device.tty?

        context "Environment variable is not set" do
          receiver = OpenStruct.new

          set = TestBench::Settings::Environment::Set.new receiver
          set.env = { }
          set.output_device = output_device

          set.()

          test "True" do
            assert receiver.color == true
          end
        end

        context "Environment variable indicates color is disabled" do
          receiver = OpenStruct.new

          set = TestBench::Settings::Environment::Set.new receiver
          set.env = { 'TEST_BENCH_COLOR' => 'off' }
          set.output_device = output_device

          set.()

          test "False" do
            assert receiver.color == false
          end
        end
      end

      context "Output device is not an interactive terminal" do
        output_device = StringIO.new
        refute output_device.tty?

        context "Environment variable is not set" do
          receiver = OpenStruct.new

          set = TestBench::Settings::Environment::Set.new receiver
          set.env = { }
          set.output_device = output_device

          set.()

          test "False" do
            assert receiver.color == false
          end
        end

        context "Environment variable indicates color is enabled" do
          receiver = OpenStruct.new

          set = TestBench::Settings::Environment::Set.new receiver
          set.env = { 'TEST_BENCH_COLOR' => 'on' }
          set.output_device = output_device

          set.()

          test "True" do
            assert receiver.color == true
          end
        end
      end
    end
  end
end
