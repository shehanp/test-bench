require_relative '../../test_init'

context "Extension" do
  context "Handle" do
    context "Event Class Not Handled" do
      cls = Class.new do
        include TestBench::Extension
      end

      extension = cls.new

      event = TestBench::Run::Event::Started.new

      test "Name error is not raised" do
        begin
          extension.handle event
        rescue NameError => name_error
        end

        assert name_error.nil?
      end
    end
  end
end
