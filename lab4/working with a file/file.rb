# Выводит все строки
def index
  File.open('file.txt').each do |line|
    puts line
  end
  # puts File.readlines('file.txt')
  # Метод readlines обрабатывает открытие и закрытие файла
  # File.open('file.txt').each do |line| " предпочтительнее, чем readlines,
  # поскольку записывать в память файл неизвестного размера не есть рекомендуемая практика
end

# Находит конкретную строку в файле и выводит ее
def find(id)
  File.open('file.txt') do |file|
    file.each_with_index do |line, index|
      if index == id
        puts line
        break
      end
    end
  end
end

find(22)

