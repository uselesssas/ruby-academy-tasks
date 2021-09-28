require 'rspec'
require_relative '../search_letters'

RSpec.describe 'search_letters' do
  it 'If the word ends with CS' do
    expect(search_letters('raCS')).to eq(16)
  end

  it 'If CS is written with a small letter at the end' do
    expect(search_letters('racs')).to eq('scar')
  end

  it 'If the word does not end with CS' do
    expect(search_letters('raCSra')).to eq('arSCar')
  end
end
