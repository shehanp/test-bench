require_relative '../../../test_init'

context "Event" do
  context "Publish" do
    context "Registry" do
      context "Key" do
        context "Object" do
          object = Object.new

          key = TestBench::Event::Publish::Registry::Key.(object)

          test "Hash value of object" do
            assert key == object.hash
          end
        end

        context "Binding" do
          object = Object.new
          _binding = object.instance_exec { binding }

          key = TestBench::Event::Publish::Registry::Key.(_binding)

          test "Hash value of binding receiver" do
            assert key == object.hash
          end
        end
      end
    end
  end
end
