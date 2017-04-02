require_relative '../test_init'

context "Settings" do
  context "Default Values" do
    settings = TestBench::Settings.new

    context "Abort on error" do
      test "False" do
        assert settings.abort_on_error == false
      end
    end

    context "Color" do
      test "False" do
        assert settings.color == false
      end
    end

    context "Default file pattern" do
      test "All files under tests/" do
        assert settings.default_file_pattern == 'tests/**/*.rb'
      end
    end

    context "Exclude pattern" do
      test "Any file ending with _init.rb" do
        assert settings.exclude_pattern == '_init.rb$'
      end
    end

    context "Logger" do
      test "False" do
        assert settings.logger == false
      end
    end

    context "Reverse backtraces" do
      test "False" do
        assert settings.reverse_backtraces == false
      end
    end

    context "Silent" do
      test "False" do
        assert settings.silent == false
      end
    end

    context "Verbose" do
      test "False" do
        assert settings.verbose == false
      end
    end
  end
end
