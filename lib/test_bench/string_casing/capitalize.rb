module TestBench
  module StringCasing
    module Capitalize
      def self.call str
        str[0] = str[0].upcase
        str
      end

      module Reverse
        def self.call str
          str[0] = str[0].downcase
          str
        end
      end
    end
  end
end
