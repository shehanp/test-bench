require_relative '../../test_init'

context "Event" do
  context "Publish" do
    subscriber = Controls::Subscriber.example

    publish = TestBench::Event::Publish.new
    publish.add_subscriber subscriber

    publish.publish :some_event

    test "Activity is published" do
      assert subscriber.received?(:some_event)
    end
  end
end
