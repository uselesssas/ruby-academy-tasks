require 'rspec'
require_relative '../greeting'

describe Greeting do
  it '#greeting' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('даниил', 'Доманецкий', 21)
    expect do
      Greeting.new.greeting
    end.to_not output('Привет, Даниил Доманецкий. Самое время заняться делом!').to_stdout

    allow_any_instance_of(Kernel).to receive(:gets).and_return('Даниил', 'доманецкий', 17)
    expect do
      Greeting.new.greeting
    end.to_not output('Привет, Даниил Доманецкий.' \
                              'Тебе меньше 18 лет, но начать учится программировать никогда не рано').to_stdout
  end

  it '#greeting - checking exceptions' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('', ' ', 17)
    expect { Greeting.new.greeting }.to raise_error(StandardError)

    allow_any_instance_of(Kernel).to receive(:gets).and_return(' ', '', 21)
    expect { Greeting.new.greeting }.to raise_error(StandardError)

    allow_any_instance_of(Kernel).to receive(:gets).and_return('Даниил', 'Доманецкий', -1)
    expect { Greeting.new.greeting }.to raise_error(StandardError)
  end
end
