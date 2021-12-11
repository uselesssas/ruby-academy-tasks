require 'tempfile'
FILE = 'file.txt'.freeze

# Выводит все строки
def index
  File.foreach(FILE) { |line| puts line }
end

# Находит конкретную строку в файле и выводит ее
# Отсчёт строк начинается с 0
def find(id)
  File.foreach(FILE).with_index do |line, index|
    if index == id
      puts line
      break
    end
  end
end

# Находит все строки, где есть указанный паттерн
def where(pattern)
  lowercase_pattern = pattern.downcase
  File.foreach(FILE) do |line|
    puts line if line.downcase.include?(lowercase_pattern)
  end
end

# Обновляет конкретную строку файла
# Отсчёт строк начинается с 0
def update(id, text)
  tempfile = Tempfile.new('tempfile')

  File.open(tempfile, 'w') do |file|
    File.foreach(FILE).with_index do |line, index|
      line = text if id == index
      file.puts(line)
    end
  end

  File.open(FILE, 'w') do |file|
    File.open(tempfile).each do |line|
      file.puts(line)
    end
  end

  tempfile.unlink
end

# Удаляет строку
# Отсчёт строк начинается с 0
def delete(id)
  tempfile = Tempfile.new('tempfile')

  File.open(tempfile, 'w') do |file|
    File.open(FILE).each_with_index do |line, index|
      next if id == index

      file.puts(line)
    end
  end

  File.open(FILE, 'w') do |file|
    File.open(tempfile).each do |line|
      file.puts(line)
    end
  end

  tempfile.unlink
end

# index
# find(1)
# where('анна')
# update(1, 'text')
# delete(1)
