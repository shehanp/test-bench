require_relative '../../../test_init'

context "Output" do
  context "Write" do
    context "Indentation" do
      context "Decrease" do
        write = TestBench::Output::Write.new

        context "From 1 to 0" do
          context "Block" do
            block_executed = false

            write.indentation = 1

            write.decrease_indentation do
              block_executed = true
            end

            test "Block is executed" do
              assert block_executed == true
            end
          end

          context "No block" do
            write.indentation = 1

            test "Nothing is raised" do
              begin
                write.decrease_indentation
              rescue => error
              end

              assert error.nil?
            end
          end
        end

        context do
          context "Block" do
            block_executed = false

            write.indentation = 2

            write.decrease_indentation do
              block_executed = true
            end

            test "Block is not executed" do
              assert block_executed == false
            end
          end
        end
      end
    end
  end
end
