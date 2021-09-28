require 'rspec'
require_relative '../foobar'

RSpec.describe 'foobar' do
  it 'If none is equal to 20' do
    expect(foobar(10, 10)).to eq(20)
  end

  it 'If the first is 20' do
    expect(foobar(20, 10)).to eq(10)
  end

  it 'If the second is 20' do
    expect(foobar(10, 20)).to eq(20)
  end
end
