require_relative '../test_init'

context "String Casing" do
  context "Underscore" do
    camel = 'someString'
    pascal = 'SomeString'
    underscore = 'some_string'

    context "String is camel cased" do
      str = TestBench::StringCasing::Underscore.(camel)

      test "#{str.inspect} == #{underscore.inspect}" do
        assert str == underscore
      end
    end

    context "String is pascal cased" do
      str = TestBench::StringCasing::Underscore.(pascal)

      test "#{str.inspect} == #{underscore.inspect}" do
        assert str == underscore
      end
    end

    context "String is underscore cased" do
      str = TestBench::StringCasing::Underscore.(underscore)

      test "#{str.inspect} == #{underscore.inspect}" do
        assert str == underscore
      end
    end
  end
end
