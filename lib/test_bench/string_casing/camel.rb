module TestBench
  module StringCasing
    module Camel
      def self.call str
        str.gsub! pattern do |str|
          "#{str[0]}#{str[-1].upcase}"
        end

        Capitalize::Reverse.(str)

        str
      end

      def self.pattern
        @pattern ||= %r{([[:alnum:]]_[[:alnum:]])}
      end
    end
  end
end
