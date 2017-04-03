require_relative '../../test_init'

context "Extension" do
  context "Output" do
    context "Build" do
      context do
        cls = Class.new do
          include TestBench::Extension::Handle
          include TestBench::Extension::Output
        end

        extension = cls.build

        test "Standard output" do
          assert extension.output_device == $stdout
        end
      end

      context "Configure method is specialized" do
        cls = Class.new do
          include TestBench::Extension::Handle
          include TestBench::Extension::Output

          def configure
          end
        end

        extension = cls.build

        test "Standard output" do
          assert extension.output_device == $stdout
        end
      end
    end
  end
end
