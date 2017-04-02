require_relative '../../test_init'

context "Extension" do
  context "Handle" do
    context "Macro" do
      cls = Class.new do
        include TestBench::Extension

        handle TestBench::Run::Event::Started do
          :started
        end
      end

      extension = cls.new

      test "Defines method corresponding to class name" do
        assert extension.public_methods.include?(:handle_started)
      end

      test "Specified block is used as method implementation" do
        result = extension.handle_started

        assert result == :started
      end
    end
  end
end
