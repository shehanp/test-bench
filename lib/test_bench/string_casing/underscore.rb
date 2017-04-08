module TestBench
  module StringCasing
    module Underscore
      def self.call str
        str.gsub! pattern do |str|
          str.downcase!
          str.insert 1, '_'
          str
        end

        Capitalize::Reverse.(str)

        str
      end

      def self.pattern
        @pattern ||= %r{([[:alnum:]])[A-Z]}
      end
    end
  end
end
