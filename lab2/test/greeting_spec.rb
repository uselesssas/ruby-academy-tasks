require 'rspec'
require_relative '../greeting'

RSpec.describe 'Greeting' do
  it '#greeting age > 18' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Даниил', 'Доманецкий', 21)

    expect(greeting).to eq('Привет, Даниил Доманецкий. Самое время заняться делом!')
  end

  it '#greeting age < 18' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Даниил', 'Доманецкий', 17)

    expect(greeting).to eq('Привет, Даниил Доманецкий. Тебе меньше 18 лет, но начать учится программировать никогда не рано!')
  end
end
