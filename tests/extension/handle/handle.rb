require_relative '../../test_init'

context "Extension" do
  context "Handle" do
    context "0-arity" do
      cls = Class.new do
        include TestBench::Extension::Handle

        def handle_started
          :handled_started
        end
      end

      extension = cls.new

      event = TestBench::Run::Event::Started.new

      test "Handler method is invoked" do
        result = extension.handle event

        assert result == :handled_started
      end
    end

    context "1-arity" do
      cls = Class.new do
        include TestBench::Extension::Handle

        def handle_started event
          event
        end
      end

      extension = cls.new

      event = TestBench::Run::Event::Started.new

      test "Handler method is supplied event" do
        result = extension.handle event

        assert result == event
      end
    end

    context "Other arity" do
      cls = Class.new do
        include TestBench::Extension::Handle

        def handle_started event, extra_arg
        end
      end

      extension = cls.new

      event = TestBench::Run::Event::Started.new

      test "Argument error is raised" do
        begin
          extension.handle event
        rescue ArgumentError => error
        end

        refute error.nil?
      end
    end
  end
end
