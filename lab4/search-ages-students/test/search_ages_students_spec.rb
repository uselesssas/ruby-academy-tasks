require 'rspec'
require_relative '../search_ages_students'

describe SearchAgesStudents do
  # before(:each) do
  #   File.write('results.txt', '')
  # end
  #
  # it '' do
  #   allow_any_instance_of(Kernel).to receive(:gets).and_return('-1')
  # end

  it '' do
    @buffer = StringIO.new
    @filename = 'students.txt'
    @content = "Белова Мия 20\nГолубева Анна 21\nАртамонов Никита 20\nАлексеева Эмилия 19\n"
    allow(File).to receive(:open).with(@filename, 'w').and_yield(@buffer)

    # call the function that writes to the file
    File.open(@filename, 'w') { |f| f.write(@content) }

    # reading the buffer and checking its content.
    expect(@buffer.string).to eq(@content)
  end
end
