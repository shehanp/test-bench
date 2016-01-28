module TestBench
  class Assert
    module Error
      def error? error_class=nil, &block
        error_class ||= StandardError

        block.()
        return nil

      rescue error_class => error
        return error
      end
    end
  end
end
