require_relative '../../test_init'

context "Event" do
  context "Subscriber" do
    context "Add" do
      subscriber = Class.new do
        include TestBench::Event::Subscriber
      end.new

      settings = TestBench::Settings.new

      publisher = TestBench::Event::Publish.new

      publisher.add_subscriber subscriber

      test "Subscriber is added to list of observers" do
        assert publisher.count_observers == 1
      end
    end
  end
end
