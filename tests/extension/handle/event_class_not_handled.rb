require_relative '../../test_init'

context "Extension" do
  context "Handle" do
    context "Event Class Not Handled" do
      cls = Class.new do
        include TestBench::Extension::Handle
      end

      extension = cls.new

      event = Controls::Event.example

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
