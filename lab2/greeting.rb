# Определяем 2 новых класса исключений
class EmptyNameError < StandardError; end
class InvalidAgeError < StandardError; end

# Запрос пользовательских данных и вывод приветствия
class Greeting
  attr_reader :name, :surname, :age

  def name=(name)
    # strip.empty? аналог #blank? из Rails
    raise EmptyNameError, 'Ошибка: Имя не может быть пустым!' if name.strip.empty?

    @name = name
  end

  def surname=(surname)
    raise EmptyNameError, 'Ошибка: Фамилия не может быть пустой!' if surname.strip.empty?

    @surname = surname
  end

  def age=(age)
    raise InvalidAgeError, "Ошибка: Возраст #{age} недействителен!" if age.negative?

    @age = age
  end

  # Просит пользователя ввести его name, surname, age
  def user_data_query
    print 'Введите Ваше имя: '
    self.name = gets.chomp.capitalize
    print 'Введите Вашу фамилию: '
    self.surname = gets.chomp.capitalize
    print 'Введите Ваш возраст: '
    self.age = gets.to_i
  rescue EmptyNameError, InvalidAgeError => e # Если возникло исключение
    puts e # Выводим сообщение, содержащееся в исключении
    retry # Перезапуск метода
  end

  # Вывод приветствия в зависимости от age
  def greeting
    user_data_query
    if age < 18
      puts "Привет, #{name} #{surname}. Тебе меньше 18 лет, но начать учится программировать никогда не рано"
    else
      puts "Привет, #{name} #{surname}. Самое время заняться делом!"
    end
  end
end

Greeting.new.greeting
