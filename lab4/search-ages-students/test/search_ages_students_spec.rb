require 'rspec'
require_relative '../search_ages_students'

describe SearchAgesStudents do
  before do
    File.write('students.txt',
               "Белова Мия 17\nГолубева Анна 18\nАртамонов Никита 19\nАлексеева Эмилия 20\nИльина Василиса 20\n")
  end

  subject { SearchAgesStudents.new }

  it 'recording of one ages' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('20', '-1')
    expect(subject.init)
    expect do
      subject.output_students(%w[20])
    end.to output("Записанны студенты с возрастами - 20.\n" \
                          "Алексеева Эмилия 20\n" \
                          "Ильина Василиса 20\n").to_stdout
  end

  it 'recording of two ages' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('17', '20', '-1')
    expect(subject.init)
    expect do
      subject.output_students(%w[17 20])
    end.to output("Записанны студенты с возрастами - 17, 20.\n" \
                          "Белова Мия 17\n" \
                          "Алексеева Эмилия 20\n" \
                          "Ильина Василиса 20\n").to_stdout
  end

  it 'recording of all ages' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('17', '18', '19', '20')
    expect(subject.init)
    expect do
      subject.output_students(%w[17 18 19 20])
    end.to output("Записанны студенты с возрастами - 17, 18, 19, 20.\n" \
                          "Белова Мия 17\n" \
                          "Голубева Анна 18\n" \
                          "Артамонов Никита 19\n" \
                          "Алексеева Эмилия 20\n" \
                          "Ильина Василиса 20\n").to_stdout
  end

  it 'trying to record the same age multiple times' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('17', '17', '17', '-1')
    expect(subject.init)
    expect do
      subject.output_students(%w[17])
    end.to output("Записанны студенты с возрастами - 17.\n" \
                          "Белова Мия 17\n").to_stdout
  end

  it 'attempt to record non-existent ages' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('16', '20', '21', '-1')
    expect(subject.init)
    expect do
      subject.output_students(%w[20])
    end.to output("Записанны студенты с возрастами - 20.\n" \
                          "Алексеева Эмилия 20\n" \
                          "Ильина Василиса 20\n").to_stdout
  end

  after do
    File.delete('results.txt')
  end
end
