class CashMachine
  attr_accessor :balance

  def initialize
    if File.file?('balance.txt')
      File.open('balance.txt') do |f|
        self.balance = f.read.to_f
      end
    else
      self.balance = 100.0 # Если баланс не считался с файла задаём начальный баланс
    end
  end

  def show_balance
    puts "Ваш баланс: #{@balance}₽"
  end

  def deposit
    puts 'Сколько Вы хотите внести?'
    print '> '
    add_balance = gets.to_f
    if add_balance.positive?
      @balance += add_balance
      show_balance
    else
      puts "Ошибка: Вы не можете внести #{add_balance}₽"
    end
  end

  def withdraw
    puts 'Сколько Вы хотите снять?'
    print '> '
    withdraw_balance = gets.to_f
    if withdraw_balance.positive? && withdraw_balance <= @balance
      @balance -= withdraw_balance
    else
      puts "Ошибка: Вы не можете снять #{withdraw_balance}₽"
    end
    show_balance
  end

  def cls
    system('clear')
  end

  def list
    puts
    puts 'Показать баланс нажмите «B»'
    puts 'Внести наличные нажмите «D»'
    puts 'Снять наличные нажмите «W»'
    puts 'Выйти нажмите «Q»'
    print '> '
  end

  def user(choice)
    case choice
    when 'b' then show_balance
    when 'd' then deposit
    when 'w' then withdraw
    else cls
    end
  end

  # Перезаписываем полученный баланс в файл
  def writing_balance
    File.open('balance.txt', 'w') do |f|
      f.puts(@balance)
    end
  end

  # Запускающий метод
  def init
    loop do
      list
      choice = gets.chomp.downcase
      break if choice == 'q'

      user(choice)
    end
    writing_balance
  end
end

CashMachine.new.init

