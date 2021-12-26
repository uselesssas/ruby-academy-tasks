require 'rspec'
require '../ATM-machine v2/ATM_machine'

RSpec.describe 'lab5' do
  context "lab5_1" do
    before do
      File.write('balance.txt', '200', mode: 'w')
    end

    subject { CashMachine.new }

    it '#deposit' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("d\n", -10, 20, "q\n")
      expect(subject.init)
      expect { subject.show_balance }.to output("Ваш баланс: 220 вечнозеленых\n").to_stdout
    end

    it '#withdraw' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("w\n", -10, 1000, 100, "q\n")
      expect(subject.init)
      expect { subject.show_balance }.to output("Ваш баланс: 100 вечнозеленых\n").to_stdout
    end

    it '#balance' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("b\n", "q\n")
      expect(subject.init)
      expect { subject.show_balance }.to output("Ваш баланс: 200 вечнозеленых\n").to_stdout
    end

    it '#all cases' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("d\n", -10, 20, "w\n", -10, 100, "q\n")
      expect(subject.init)
      expect { subject.show_balance }.to output("Ваш баланс: 120 вечнозеленых\n").to_stdout
    end

  end
end

