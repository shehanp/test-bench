require_relative '../test_init'

context "Run" do
  context "Publish Activity" do
    subscriber = TestBench::Run::Subscriber::Example.new

    run = TestBench::Run.new
    run.add_subscriber subscriber

    run.record :some_activity, :some_data

    test "Activity is published" do
      assert subscriber.received?(:some_activity, :some_data)
    end
  end
end
