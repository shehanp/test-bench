require_relative '../test_init'

context "String Casing" do
  context "Pascal" do
    camel = 'someString'
    pascal = 'SomeString'
    underscore = 'some_string'

    context "String is camel cased" do
      str = TestBench::StringCasing::Pascal.(camel)

      test "#{str.inspect} == #{pascal.inspect}" do
        assert str == pascal
      end
    end

    context "String is pascal cased" do
      str = TestBench::StringCasing::Pascal.(pascal)

      test "#{str.inspect} == #{pascal.inspect}" do
        assert str == pascal
      end
    end

    context "String is underscore cased" do
      str = TestBench::StringCasing::Pascal.(underscore)

      test "#{str.inspect} == #{pascal.inspect}" do
        assert str == pascal
      end
    end
  end
end
