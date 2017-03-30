require_relative '../../test_init'

context "Settings" do
  context "Environment" do
    context "Boolean" do
      receiver = OpenStruct.new

      env = {}

      environment = TestBench::Settings::Environment::Set.new receiver
      environment.env = env

      env_var = 'TEST_BENCH_SOME_SETTING'

      %w(On Yes Y True T 1).each do |value|
        context value do
          env[env_var] = value

          value = environment.boolean env_var

          test "True" do
            assert value == true
          end
        end
      end

      %w(Off No N False F 0).each do |value|
        context value do
          env[env_var] = value

          value = environment.boolean env_var

          test "False" do
            assert value == false
          end
        end
      end

      context "Case sensitivity" do
        env[env_var] = 'tRuE'

        value = environment.boolean env_var

        test "Case insensitive" do
          assert value == true
        end
      end

      context "Unknown value" do
        env[env_var] = 'unknown-value'

        test "Raises argument error" do
          begin
            environment.boolean env_var
          rescue ArgumentError => argument_error
          end

          refute argument_error.nil?
        end
      end
    end
  end
end
