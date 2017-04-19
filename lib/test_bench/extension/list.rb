module TestBench
  module Extension
    class List
      attr_reader :extensions

      def initialize *extensions
        @extensions = extensions
      end

      def add cls
        extension = cls.build

        extensions << extension

        extension
      end

      def remove extension
        extensions.reject! do |e|
          e == extension || extension === e
        end
      end

      def extend run
        extensions.each do |extension|
          extension.(run)
        end
      end
    end
  end
end
