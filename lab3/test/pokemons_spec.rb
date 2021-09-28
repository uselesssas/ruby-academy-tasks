require 'rspec'
require_relative '../pokemons'

RSpec.describe 'add_pokemon' do
  it '' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Pikachu', 'Yellow')

    expect(add_pokemon).to eq([{ name: 'Pikachu', color: 'Yellow' }])
  end
end
