require_relative './test_init'

begin

describe 'This' do
  it 'Should be a Sentence' do
    assert true
  end

  context 'Is' do
    specify 'A Sentence' do
      assert false
    end
  end
end

rescue => error
end

assert error
