require_relative '../test_init'

context "String Casing" do
  context "Camel" do
    camel = 'someString'
    pascal = 'SomeString'
    underscore = 'some_string'

    context "String is camel cased" do
      str = TestBench::StringCasing::Camel.(camel)

      test "#{str.inspect} == #{camel.inspect}" do
        assert str == camel
      end
    end

    context "String is pascal cased" do
      str = TestBench::StringCasing::Camel.(pascal)

      test "#{str.inspect} == #{camel.inspect}" do
        assert str == camel
      end
    end

    context "String is underscore cased" do
      str = TestBench::StringCasing::Camel.(underscore)

      test "#{str.inspect} == #{camel.inspect}" do
        assert str == camel
      end
    end
  end
end
