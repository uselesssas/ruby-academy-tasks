require 'rspec'
require_relative '../search_letters'

describe '#search_letters' do
  it 'should be ok for a word ending with CS' do
    expect(search_letters('raCS')).to eq(16)
  end

  it 'should be ok for a word ending in CS in lowercase' do
    expect(search_letters('racs')).to eq('scar')
  end

  it 'should be ok for words not ending in CS' do
    expect(search_letters('raCSra')).to eq('arSCar')
  end
end
