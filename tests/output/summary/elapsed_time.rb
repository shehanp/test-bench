require_relative '../../test_init'

context "Output" do
  context "Summary" do
    context "Elapsed Time" do
      start_time = Controls::Time.example
      finish_time = Controls::Time.example offset_milliseconds: 1

      context "Start and finish time are set" do
        summary = TestBench::Output::Summary.new
        summary.start_time = start_time
        summary.finish_time = finish_time

        test "Returns difference" do
          assert summary.elapsed_time == 0.001
        end
      end

      context "Just start time is set" do
        summary = TestBench::Output::Summary.new
        summary.start_time = start_time

        test "Returns nil" do
          assert summary.elapsed_time == nil
        end
      end

      context "Just finish time is set" do
        summary = TestBench::Output::Summary.new
        summary.finish_time = finish_time

        test "Returns nil" do
          assert summary.elapsed_time == nil
        end
      end

      context "Neither start time nor finish time are set" do
        summary = TestBench::Output::Summary.new

        test "Returns nil" do
          assert summary.elapsed_time == nil
        end
      end
    end
  end
end
