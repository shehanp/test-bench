require_relative '../../test_init'

context "Output" do
  context "Display Error" do
    context "Dependency" do
      cls = Class.new do
        include TestBench::Output::DisplayError::Dependency
      end

      error = Controls::Error.example

      display_error = cls.new.display_error
      display_error.(error)

      test "Text is written to string" do
        control_text = Controls::Error::Backtrace::Text.filtered

        assert display_error.device.string == control_text
      end
    end
  end
end
