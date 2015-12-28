require_relative './test_init'

describe 'This' do
  it 'Should be a Sentence' do
    assert true
  end

  context 'Is' do
    specify 'A Sentence' do
      assert false
    end
  end

  context 'Is Another' do
    specify 'Sentence' do
      assert false
    end
  end

  context 'Is Yet Another' do
    specify 'Sentence' do
      assert false
    end
  end
end
