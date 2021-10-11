require 'rspec'
require_relative '../pokemons'

describe '#add_pokemon' do
  it 'should be ok for adding 1 pokemon' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(1, 'Pikachu', 'Yellow')
    expect(add_pokemon(pokemons = [])).to eq([{ name: 'Pikachu', color: 'Yellow' }])
  end

  it 'should be ok for adding 2 pokemon' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(2, 'P', 'Y', 'R', 'T')
    expect(add_pokemon(pokemons = [])).to eq([{ name: 'P', color: 'Y' }, { name: 'R', color: 'T' }])
  end

  it 'should be ok to add to a non-empty array' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(1, 'R', 'T')
    expect(add_pokemon(pokemons = [{ name: 'P',
                                     color: 'Y' }])).to eq([{ name: 'P', color: 'Y' }, { name: 'R', color: 'T' }])
  end
end
