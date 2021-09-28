balance = nil
if File.exist?('balance.txt') # Если файл существует
  File.open('balance.txt') do |f|
    balance = f.read.to_f # Берём баланс из файла
  end
else
  BALANCE = 100.0 # Сами задаём начальный баланс константой
end

# Вывод меню
def main_menu
  puts
  puts 'Показать баланс нажмите «B»'
  puts 'Внести наличные нажмите «D»'
  puts 'Снять наличные нажмите «W»'
  puts 'Выйти нажмите «Q»'
  print '> '
end

# Чистка консоли
def cls
  system('cls') || system('clear')
end

loop do
  main_menu
  choice = gets.chomp.downcase
  cls
  break if choice == 'q'

  if balance.nil? # Если баланс не считался с файла используем стартовый
    case choice
    when 'b' # Показать баланс
      puts "Баланс: #{BALANCE}$"
    when 'd' # Внести наличные
      puts 'Сколько Вы хотите внести?'
      print '> '
      add_balance = gets.to_i
      if add_balance.positive? # Если больше 0
        BALANCE += add_balance
        puts "Баланс: #{BALANCE}$"
      else
        puts "Ошибка: Вы не можете внести #{add_balance}$"
      end
    when 'w' # Снять наличные
      puts 'Сколько Вы хотите снять?'
      print '> '
      withdraw_balance = gets.to_i
      # Если больше 0 и <= текущего баланса
      if withdraw_balance.positive? && withdraw_balance <= BALANCE
        BALANCE -= withdraw_balance
        puts "Баланс: #{BALANCE}$"
      else
        puts "Ошибка: Вы не можете снять #{withdraw_balance}$"
        puts "Ваш баланс: #{BALANCE}$"
      end
    else
      cls
    end
  else # Используем баланс с файла
    case choice
    when 'b' # Показать баланс
      puts "Баланс: #{balance}$"
    when 'd' # Внести наличные
      puts 'Сколько Вы хотите внести?'
      print '> '
      add_balance = gets.to_i
      if add_balance.positive? # Если больше 0
        balance += add_balance
        puts "Баланс: #{balance}$"
      else
        puts "Ошибка: Вы не можете внести #{add_balance}$"
      end
    when 'w' # Снять наличные
      puts 'Сколько Вы хотите снять?'
      print '> '
      withdraw_balance = gets.to_i
      # Если больше 0 и <= текущего баланса
      if withdraw_balance.positive? && withdraw_balance <= balance
        balance -= withdraw_balance
        puts "Баланс: #{balance}$"
      else
        puts "Ошибка: Вы не можете снять #{withdraw_balance}$"
        puts "Ваш баланс: #{balance}$"
      end
    else
      cls
    end
  end
end
# Перезапись получившегося баланса в файл
File.open('balance.txt', 'w') do |f|
  if balance.nil? # Если баланс не считался с файла
    f.puts(BALANCE)
  else
    f.puts(balance)
  end
end

