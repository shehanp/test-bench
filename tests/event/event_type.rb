require_relative '../test_init'

context "Event" do
  context "Event Type" do
    context do
      cls = TestBench::Event.define 

      def cls.name
        'SomeNamespace::SomeEvent'
      end

      context "Class" do
        test do
          assert cls.event_type == :some_event
        end
      end

      context "Instance" do
        instance = cls.new

        test do
          assert instance.event_type == :some_event
        end
      end
    end

    context "Anonymous class" do
      cls = TestBench::Event.define 

      test do
        assert cls.event_type == nil
      end
    end
  end
end
