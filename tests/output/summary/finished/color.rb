require_relative '../../../test_init'

context "Output" do
  context "Summary" do
    context "Finished" do
      context "Color" do
        finished = Controls::Event.finished

        context "Run passed" do
          summary = Controls::Output::Summary.example

          device = StringIO.new

          Controls::Output::Write.configure summary, device: device, color: true

          summary.(finished)

          test "Cyan" do
            control_text = Controls::Output::Summary::Text.example fg: :cyan

            assert device.string == control_text
          end
        end

        context "Run failed" do
          summary = Controls::Output::Summary::Failed.example

          device = StringIO.new

          Controls::Output::Write.configure summary, device: device, color: true

          summary.(finished)

          test "Red" do
            control_text = Controls::Output::Summary::Failed.text fg: :red

            assert device.string == control_text
          end
        end
      end
    end
  end
end
