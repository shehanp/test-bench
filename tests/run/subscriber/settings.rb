require_relative '../../test_init'

context "Run" do
  context "Subscriber" do
    context "Settings" do
      subscriber_class = Class.new do
        include TestBench::Run::Subscriber

        setting :abort_on_error
      end

      settings = TestBench::Settings.new
      settings.abort_on_error = :some_value

      subscriber = subscriber_class.new

      settings.set subscriber

      test "Setting is set" do
        assert subscriber.abort_on_error == :some_value
      end
    end
  end
end
