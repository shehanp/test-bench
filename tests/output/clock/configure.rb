require_relative '../../test_init'

context "Output" do
  context "Clock" do
    context "Configure" do
      receiver = OpenStruct.new

      clock = TestBench::Output::Clock.configure receiver

      context "Now" do
        time = clock.now

        test "Time instance is returned" do
          assert time.instance_of?(Time)
        end

        test "Time is sampled from system clock" do
          delta = Time.now - time

          assert delta < 1
        end
      end
    end
  end
end
