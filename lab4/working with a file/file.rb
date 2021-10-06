# Выводит все строки
def index
  File.open('file.txt').each { |l| puts l }
  # File.open('file.txt').each do |line| " предпочтительнее, чем readlines
  # поскольку записывать в память файл неизвестного размера не есть рекомендуемая практика
end

# Находит конкретную строку в файле и выводит ее
def find(id)
  File.open('file.txt').each_with_index do |line, index|
    if index == id
      puts line
      break
    end
  end
end

# Находит все строки, где есть указанный паттерн
def where(pattern)
  lowercase_pattern = pattern.downcase
  File.open('file.txt').each do |l|
    lowercase_line = l.downcase
    puts l if lowercase_line.include?(lowercase_pattern)
  end
end

# Обновляет конкретную строку файла
def update(id, text)

end

# Удаляет строку
def delete(id)

end
