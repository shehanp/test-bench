require_relative '../../../test_init'

context "Output" do
  context "Structure" do
    context "Test Started" do
      handle = TestBench::Output::Handlers::Structure.new

      device = StringIO.new

      write = Controls::Output::Write.configure(
        handle,
        device: device,
        indentation: 0
      )

      event = Controls::Event.test_started

      handle.(event)

      test "Nothing is written" do
        assert device.string == ''
      end

      test "Indentation is unchanged" do
        assert write.indentation == 0
      end
    end
  end
end
