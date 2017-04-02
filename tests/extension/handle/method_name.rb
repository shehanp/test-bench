require_relative '../../test_init'

context "Extension" do
  context "Handle" do
    context "Method Name" do
      context do
        event_class = TestBench::Run::Event::Started

        method_name = TestBench::Extension::Handle::MethodName.get event_class

        test "Method name includes inner namespace" do
          assert method_name == :handle_started
        end
      end

      context "Event class contains inner namespace" do
        event_class = TestBench::Run::Event::Test::Started

        method_name = TestBench::Extension::Handle::MethodName.get event_class

        test "Method name includes inner namespace" do
          assert method_name == :handle_test_started
        end
      end

      context "Event instance is supplied" do
        event = TestBench::Run::Event::Started.new

        method_name = TestBench::Extension::Handle::MethodName.get event

        test "Class name is used" do
          assert method_name == :handle_started
        end
      end
    end
  end
end
