module TestBench
  module Controls
    module Time
      def self.example offset_milliseconds: nil
        offset_milliseconds ||= 0

        seconds = Rational(11_000 + offset_milliseconds, 1_000)

        ::Time.new 2000, 1, 1, 11, 11, seconds, 0
      end
    end
  end
end
