module TestBench
  module Controls
    module Output
      module Write
        def self.example device=nil, color: nil, indentation: nil, output_level: nil
          write = TestBench::Output::Write.new

          write.color = color unless color.nil?
          write.indentation = indentation unless indentation.nil?
          write.output_level = output_level unless output_level.nil?

          write.device = device unless device.nil?

          write
        end

        def self.configure receiver, *arguments
          write = example *arguments

          receiver.public_send :write=, write

          write
        end
      end
    end
  end
end
