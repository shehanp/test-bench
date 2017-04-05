require_relative '../../test_init'

context "Extension" do
  context "Handle" do
    context "Build Method" do
      context "Specialized configuration" do
        cls = Class.new do
          include TestBench::Extension::Handle

          def configure
            @configured = true
          end

          def configured?
            @configured ? true : false
          end
        end

        extension = cls.build

        test do
          assert extension.configured?
        end
      end

      context "Settings" do
        settings = TestBench::Settings.new
        settings.abort_on_error = :value

        cls = Class.new do
          include TestBench::Extension::Handle

          setting :abort_on_error
        end

        extension = cls.build settings: settings

        test do
          assert extension.abort_on_error == :value
        end
      end
    end
  end
end
