require_relative '../test_init'

context "String Casing" do
  context "Capitalize" do
    context do
      in_str = 'aA'

      out_str = TestBench::StringCasing::Capitalize.(in_str)

      test do
        assert out_str == 'AA'
      end
    end

    context "Reverse" do
      in_str = 'Aa'

      out_str = TestBench::StringCasing::Capitalize::Reverse.(in_str)

      test do
        assert out_str == 'aa'
      end
    end
  end
end
