require_relative '../../test_init'

context "Output" do
  context "Commented" do
    handle = TestBench::Output::Handlers::Commented.new

    device = StringIO.new

    Controls::Output::Write.configure handle, device: device

    event = Controls::Event.commented

    handle.(event)

    test "Nothing is written" do
      assert device.string == ''
    end
  end
end
