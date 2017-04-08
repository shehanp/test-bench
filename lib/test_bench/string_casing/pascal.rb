module TestBench
  module StringCasing
    module Pascal
      def self.call str
        Camel.(str)

        Capitalize.(str)

        str
      end
    end
  end
end
