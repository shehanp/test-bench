require_relative '../../../test_init'

context "Output" do
  context "Summary" do
    context "Non Plural Values" do
      summary = Controls::Output::Summary::NonPluralValues.example

      device = StringIO.new

      Controls::Output::Write.configure summary, device: device

      finished = Controls::Event.finished
      summary.(finished)

      test "Summary is written" do
        assert device.string == Controls::Output::Summary::NonPluralValues.text
      end
    end
  end
end
