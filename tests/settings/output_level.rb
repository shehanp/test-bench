require_relative '../test_init'

context "Settings" do
  context "Output Level" do
    context "Silent" do
      settings = TestBench::Settings.new
      settings.silent = true

      context "Verbose" do
        settings.verbose = true

        test "Silent" do
          assert settings.output_level == :silent
        end
      end

      context "Not verbose" do
        settings.verbose = false

        test "Silent" do
          assert settings.output_level == :silent
        end
      end
    end

    context "Not silent" do
      settings = TestBench::Settings.new
      settings.silent = false

      context "Verbose" do
        settings.verbose = true

        test "Verbose" do
          assert settings.output_level == :verbose
        end
      end

      context "Not verbose" do
        settings.verbose = false

        test "Normal" do
          assert settings.output_level == :normal
        end
      end
    end
  end
end
