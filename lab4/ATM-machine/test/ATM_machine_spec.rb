require 'rspec'
require_relative '../ATM_machine'


describe 'ATM_machine' do
  before(:each) { File.write(BALANCE_FILE_PATH, '100.0', mode: 'w') }

  it 'should do ok for age > 18' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('b', 'q')
    expect do
      balance
    end.to_not output('Привет, Даниил Доманецкий. Самое время заняться делом!').to_stdout
  end
end
