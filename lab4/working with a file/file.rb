# Выводит все строки, номер строки и имя файла
def index
  ARGF.each do |line|
    puts ARGF.filename if ARGF.file.lineno == 1
    puts "#{ARGF.file.lineno}: #{line}"
  end
end

# Находит конкретную строку в файле и выводит ее
def find(id)
  ARGF.each do |line|
    puts ARGF.filename if ARGF.file.lineno == 1
    if ARGF.file.lineno == id
      puts "#{ARGF.file.lineno}: #{line}"
      ARGF.skip # break
    end
  end
end

# Находит все строки, где есть указанный паттерн
def where(pattern)
  lowercase_pattern = pattern.downcase
  ARGF.each do |line|
    puts ARGF.filename if ARGF.file.lineno == 1
    puts "#{ARGF.file.lineno}: #{line}" if line.downcase.include?(lowercase_pattern)
  end
end

# Обновляет конкретную строку файла
def update(id, text)
  file = ARGF.to_io
  require 'securerandom'
  random_string = SecureRandom.alphanumeric(3)
  temporary_file = File.new("#{random_string}.txt", 'w+')

  file.each do |line|
    line = text if ARGF.file.lineno == id
    temporary_file.puts(line)
  end

  temporary_file.each do |line|
    File.open(file, 'w').puts(line)
  end

  temporary_file.close
  File.delete(temporary_file)
  p file.closed?
end


# Удаляет строку
def delete(id)

end


update(2, '123')


