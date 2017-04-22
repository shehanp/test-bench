require_relative '../../test_init'

context "Output" do
  context "Clock" do
    context "Dependency" do
      cls = Class.new do
        include TestBench::Output::Clock::Dependency
      end

      clock = cls.new.clock

      context "Now" do
        context "Current time is not set" do
          time = clock.now

          test "Nil" do
            assert time == nil
          end
        end

        context "Current time is set" do
          control_time = Controls::Time.example
          clock.now = control_time

          time = clock.now

          test do
            assert time == control_time
          end
        end
      end
    end
  end
end

