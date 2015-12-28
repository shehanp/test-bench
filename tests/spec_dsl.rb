require_relative './test_init'

def test_errors?
  ENV['SPEC_ERRORS'] == 'on'
end

describe 'This' do
  it 'Should be a Sentence' do
    assert true
  end

  context 'Is' do
    specify 'A Sentence' do
      assert false if test_errors?
    end
  end

  context 'Is Another' do
    specify 'Sentence' do
      assert false if test_errors?
    end
  end

  context 'Is Yet Another' do
    specify 'Sentence' do
      assert false if test_errors?
    end
  end
end
