class SearchAgesStudents
  # Возвращает arr всех студентов с файла students.txt
  def students
    if File.exist?('students.txt')
      # Метод readlines обрабатывает открытие и закрытие файла
      File.readlines('students.txt')
    else
      raise 'Ошибка: файл «students.txt» не найден!'
    end
  end

  # Возвращает arr студентов с искомым student_age
  def search_age(student_age)
    students.find_all do |s|
      # s.include?(student_age)
      # или
      # s.rindex(student_age) - должна работать эффективнее в данном случае ???
      # Минус способов в том, что при вводе, например, 1 найдет все возроста которые содержут цифру 1 (18, 19, 21...)
      # Можно ограничить диапазон ввода возрастов AGES = (17..99).freeze
      # Если, например, в файле будет использоваться любой возможный возраст, то можно сделать так:
      # Просматривает переданную строку в поисках цифры, делает из цифры arr и смотрит на сответствие с искомым student_age
      s.scan(/\d+/).include?(student_age)
    end
  end

  # Записывает найденых методом search_age студентов в файл results.txt
  def writing_students(found_ages)
    File.open('results.txt', 'a') do |f|
      f.puts(found_ages)
    end
  end

  # Возвращает true если все студенты из students.txt будут записаны в results.txt
  def compare_files?
    # require 'fileutils'
    # FileUtils.compare_file('students.txt', 'results.txt')
    # Минус способа:
    # Возвращает true, если содержимое файла students.txt и файла results.txt идентично
    # Если порядок написания имён будет разный в файлах, вернёт false
    #
    # Важно чтобы в students.txt была пустая строка в конце
    # Файлы сравниваются по размеру
    File.size('students.txt') == File.size('results.txt')
    # написать новый сопоставитель
  end

  # Выводит записанные в файл results.txt возраста
  def output_students(used_ages)
    # Если не записало студентов в файл results.txt
    if used_ages.empty?
      puts 'Студенты не записаны.'
    else
      # used_ages * ', ' сработает как метод Array#join
      puts "Записанны студенты с возрастами - #{used_ages * ', '}."
      # Выводим записанные возраста
      # Метод read обрабатывает открытие и закрытие файла
      puts File.read('results.txt')
    end
  end

  def init
    used_ages = []
    loop do
      print 'Введите возраст студента («-1» - для выхода): '
      student_age = gets.chomp
      break if student_age == '-1'

      # Если мы пытаемся записать один и тот же возраст 2 раза
      if used_ages.include?(student_age)
        puts "Возраст #{student_age} уже записан в файл!"
        next # Используется для пропуска текущей итерации чтобы метод compare_files? не отрабатывался лишний раз
      else
        found_ages = search_age(student_age)
        if found_ages.empty?
          puts "Студентов с возрастом #{student_age} не существует!"
          next # Используется для пропуска текущей итерации чтобы метод compare_files? не отрабатывался лишний раз
        else
          writing_students(found_ages)
          puts "Студенты с возрастом #{student_age} записаны."
          # Записываем в arr уже использованный возраст для дальнейшей проверки
          used_ages << student_age
        end
        # Если все студенты из students.txt будут записаны в results.txt
        if compare_files? == true
          puts 'Все студенты записаны.'
          break
        end
      end
    end
    output_students(used_ages) # Выводим записанных студентов
  end
end

SearchAgesStudents.new.init
