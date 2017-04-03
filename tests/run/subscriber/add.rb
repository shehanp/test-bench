require_relative '../../test_init'

context "Run" do
  context "Subscriber" do
    context "Add" do
      subscriber = Class.new do
        include TestBench::Run::Subscriber
      end.new

      settings = TestBench::Settings.new

      run = TestBench::Run.new

      run.add_subscriber subscriber

      test "Subscriber is added to list of observers of run" do
        assert run.count_observers == 1
      end
    end
  end
end
