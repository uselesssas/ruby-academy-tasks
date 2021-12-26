require 'rspec'
require_relative '../CashMachine'

describe CashMachine do
  before do
    File.write('balance.txt', '500.0', mode: 'w')
  end

  subject { CashMachine.new }

  it '#balance' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("b\n", "q\n")
    expect(subject.init)
    expect { subject.balance }.to output("Ваш баланс: 500.0\n").to_stdout
  end

  it '#deposit' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("d\n", -100, 100, "q\n")
    expect(subject.init)
    expect { subject.balance }.to output("Ваш баланс: 600.0\n").to_stdout
  end

  it '#withdraw' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("w\n", -100, 1000, 100, "q\n")
    expect(subject.init)
    expect { subject.balance }.to output("Ваш баланс: 400.0\n").to_stdout
  end

  it 'checking menu operation' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("b\n", "d\n", 0, "w\n", 0, "q\n")
    expect(subject.init)
    expect { subject.balance }.to output("Ваш баланс: 500.0\n").to_stdout
  end
end
