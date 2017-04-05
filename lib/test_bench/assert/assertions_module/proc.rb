module TestBench
  class Assert
    module AssertionsModule
      module Proc
        def raises? error_class=nil
          call

          false

        rescue Exception => error
          if error_class.nil?
            return true
          elsif error.instance_of? error_class
            return true
          else
            return false
          end
        end
      end
    end
  end
end
