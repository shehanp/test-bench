module TestBench
  class Assert
    module Error
      def catch_error error_class=nil, &block
        error_class ||= StandardError

        block.()
        false

      rescue error_class
        return true
      end
    end
  end
end
