BALANCE_FILE_PATH = 'balance.txt'.freeze
DEFAULT_BALANCE = 100.0

def balance
  puts "Ваш баланс: #{@balance}"
end

def deposit
  loop do
    puts 'Введите сумму для внесения депозита'
    puts 'Q (ВЫЙТИ)'
    print 'Ввод: '
    amount = gets.chomp
    if amount == 'q'
      break
    elsif amount.to_f <= 0
      puts 'Ошибка: сумма депозита должна быть больше нуля.'
    else
      @balance += amount
      break
    end
  end
end

def withdraw
  loop do
    print 'Введите сумму для вывода средств: '
    amount = gets.to_f
    if amount > @balance
      puts 'Ошибка: недостаточно средств.'
    elsif amount <= 0
      puts 'Ошибка: сумма для вывода должна быть больше нуля.'
    else
      @balance -= amount
      break
    end
  end
end

def init
  @balance = if File.file?(BALANCE_FILE_PATH) && !File.zero?(BALANCE_FILE_PATH)
               File.readlines(BALANCE_FILE_PATH).first.to_f
             else
               DEFAULT_BALANCE
             end
  loop do
    print "---Меню---\n" \
              "D (ДЕПОЗИТ)\n" \
              "W (ВЫВЕСТИ)\n" \
              "B (ПОКАЗАТЬ БАЛАНС)\n" \
              "Q (ВЫЙТИ)\n" \
              'Ввод: '
    input = gets.chomp.downcase
    case input
    when 'd'
      deposit
    when 'w'
      withdraw
    when 'b'
      balance
    when 'q'
      break
    else
      next
    end
  end
  File.open(BALANCE_FILE_PATH, 'w') { |f| f.write(@balance) }
end

init
