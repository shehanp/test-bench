require_relative '../../test_init'

context "Run" do
  context "Subscriber" do
    context "Add" do
      subscriber = Class.new do
        include TestBench::Run::Subscriber

        setting :abort_on_error
      end.new

      settings = TestBench::Settings.new
      settings.abort_on_error = 'some-value'

      run = TestBench::Run.new
      run.settings = settings

      run.add_subscriber subscriber

      test "Subscriber is added to list of observers of run" do
        assert run.count_observers == 1
      end

      test "Settings are set" do
        assert subscriber.abort_on_error == 'some-value'
      end
    end
  end
end
