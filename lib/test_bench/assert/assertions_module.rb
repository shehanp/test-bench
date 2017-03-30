module TestBench
  class Assert
    module AssertionsModule
      def self.call subject, assertions_module=nil
        assertions_module ||= get subject

        return if assertions_module.nil?

        unless Object === subject
          raise BasicObjectError, "Assertions subject derives from BasicObject; cannot extend #{assertions_module}"
        end

        begin
          subject.extend assertions_module
        rescue RuntimeError
          raise FrozenSubjectError, "Assertions subject #{subject.inspect} is frozen; cannot extend #{assertions_module}"
        end
      end

      def self.get subject
        if Module === subject
          subject.const_get :Assertions if subject.const_defined? :Assertions
        elsif Object === subject
          get subject.class
        else
          singleton_class = class << subject; self; end
          singleton_class.superclass
        end
      end

      BasicObjectError = Class.new StandardError
      FrozenSubjectError = Class.new StandardError
    end
  end
end
