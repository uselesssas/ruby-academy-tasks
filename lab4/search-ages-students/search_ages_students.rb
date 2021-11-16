class SearchAgesStudents
  # Возвращает arr студентов с искомым возрастом из файла students.txt
  def search_age(student_age)
    raise 'File \'students.txt\' does not exist' unless File.exist?('students.txt')

    # Можно сразу записывать найденный возраста в файл по одному либо сохранить в массив
    # т.к. один найденный возраст не должен занимать много памяти сохраняем его в массив
    found_students = []
    File.foreach('students.txt') do |student|
      # student.include?(student_age)
      # Минус способа в том, что при вводе, например, 1 найдет все возроста которые содержут цифру 1 (18, 19, 21...)
      # Можно ограничить диапазон ввода возрастов AGES = (17..99).freeze
      # Если, например, в файле будет использоваться любой возможный возраст:
      # Просматривает переданную строку в поисках цифры, делает из цифры arr и смотрит на сответствие с искомым возрастом
      found_students << student if student.scan(/\d+/).include?(student_age)
    end
    found_students
  end

  # Записывает найденых методом #search_age студентов в файл results.txt
  def writing_students(required_age)
    File.open('results.txt', 'a') do |f|
      f.puts(required_age)
    end
  end

  # Возвращает true если все студенты из students.txt будут записаны в results.txt
  def compare_files?
    # require 'fileutils'
    # FileUtils.compare_file('students.txt', 'results.txt')
    # Минус способа:
    # Возвращает true, если содержимое файла students.txt и файла results.txt идентично
    # Если порядок написания имён будет разный вернёт false

    # Важно чтобы в students.txt была пустая строка в конце
    # Файлы сравниваются по размеру
    File.size('students.txt') == File.size('results.txt')
    # написать новый сопоставитель
  end

  # Выводит записанные в файл results.txt возраста
  def output_students(found_ages)
    # Если не записало студентов в файл results.txt
    if found_ages.empty?
      puts 'Студенты не записаны.'
    else
      # found_ages * ', ' сработает как метод Array#join
      puts "Записанны студенты с возрастами - #{found_ages * ', '}."
      # Выводим записанные возраста
      File.foreach('results.txt') do |line|
        puts line
      end
    end
  end

  def init
    found_ages = []

    loop do
      print 'Введите возраст студента для записи («-1» - для выхода): '
      student_age = gets.chomp
      break if student_age == '-1'

      # Если мы пытаемся записать один и тот же возраст больше 1 раза
      if found_ages.include?(student_age)
        puts "Возраст #{student_age} уже записан в файл!"
        next
      else
        required_age = search_age(student_age)
        if required_age.empty?
          puts "Студентов с возрастом #{student_age} не существует!"
          next
        else
          writing_students(required_age)
          puts "Студенты с возрастом #{student_age} записаны."
          # Записываем в arr найденный возраст для дальнейшей проверки
          found_ages << student_age
        end
      end
      # Если все студенты из students.txt будут записаны в results.txt
      if compare_files? == true
        puts 'Все студенты записаны.'
        break
      end
    end
    output_students(found_ages) # Вывод записанных студентов
  end
end

SearchAgesStudents.new.init
