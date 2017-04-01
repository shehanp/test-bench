require_relative '../../test_init'

context "Structure" do
  context "Assert" do
    context "Failed" do
      structure = TestBench::Structure::Example.new

      context do
        subscriber = structure.get_subscriber

        begin
          structure.instance_exec do
            assert false
          end
        rescue TestBench::Assert::Failed
        end

        test "Asserted event is published" do
          assert subscriber.received?(TestBench::Run::Event::Assertion::Asserted)
        end

        test "Assertion passed event is not published" do
          refute subscriber.received?(TestBench::Run::Event::Assertion::Passed)
        end

        test "Assertion failed event is published" do
          assert subscriber.received?(TestBench::Run::Event::Assertion::Failed)
        end
      end

      context "Error" do
        file, line = __FILE__, nil

        begin
          structure.instance_exec do
            line = __LINE__ + 1
            assert false
          end
        rescue TestBench::Assert::Failed => error
        end

        test "Is raised" do
          refute error.nil?
        end

        test "Stack trace ends at callsite of assert method" do
          deepest_location = error.backtrace_locations.first

          assert deepest_location.path == file
          assert deepest_location.lineno == line
        end
      end
    end
  end
end
