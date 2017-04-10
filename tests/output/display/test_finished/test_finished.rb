require_relative '../../../test_init'

context "Output" do
  context "Display" do
    context "Test Finished" do
      handle = TestBench::Output::Display.new

      write = Controls::Output::Write.configure(
        handle,
        indentation: 0
      )

      event = Controls::Event.test_finished

      handle.(event)

      test "Indentation is unchanged" do
        assert write.indentation == 0
      end
    end
  end
end
