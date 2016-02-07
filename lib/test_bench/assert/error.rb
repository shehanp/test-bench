module TestBench
  class Assert
    module Error
      def capture_error error_class=nil, &block
        error_class ||= StandardError

        block.()
        return nil

      rescue error_class => error
        return error
      end

      def error? error_class=nil, &block
        raised_error = capture_error error_class, &block

        if error_class
          raised_error.class == error_class
        elsif raised_error
          true
        else
          false
        end
      end
    end
  end
end
