require_relative '../../test_init'

context "Assert" do
  context "Assertions Module" do
    assertions_module = Module.new do
      def extended?
        true
      end
    end

    context "Implicit" do
      cls = Class.new do
        const_set :Assertions, assertions_module

        def extended?
          false
        end
      end

      extended = false

      TestBench::Assert.(cls.new) {
        extended = self.extended?
      }

      test "Extended" do
        assert extended
      end
    end

    context "Explicit" do
      cls = Class.new do
        def extended?
          false
        end
      end

      extended = false

      TestBench::Assert.(cls.new, assertions_module) {
        extended = self.extended?
      }

      test "Extended" do
        assert extended
      end
    end
  end
end
