require_relative '../test_init'

context "Run" do
  context "Publish Event" do
    subscriber = TestBench::Run::Subscriber::Example.new

    run = TestBench::Run.new
    run.add_subscriber subscriber

    run.publish :some_event

    test "Activity is published" do
      assert subscriber.received?(:some_event)
    end
  end
end
