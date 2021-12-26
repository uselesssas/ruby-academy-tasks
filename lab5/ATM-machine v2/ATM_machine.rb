class CashMachine
  PATH_BALANCE = "balance.txt"
  DEFAULT_BALANCE = 100

  def initialize
    if File.exist?(PATH_BALANCE)
      @balance = File.read(PATH_BALANCE).to_i
      raise TypeError, 'Неверно считанный баланс из файла!' unless @balance.is_a?(Integer)
    else
      @balance = DEFAULT_BALANCE
    end
    init
  end

  def init
    puts "Я - Банкомат 3000.\nМои команды: w - снять деньги, d - осуществить депозит, b - показать баланс, q - выйти."
    loop do
      action = gets
      case action
      when "q\n"
        File.write(PATH_BALANCE, "#{@balance}", mode: "w")
        puts "Выход из программы"
        break
      when "b\n"
        show_balance
      when "w\n"
        withdraw
      when "d\n"
        deposit
      else
        puts "Не та команда!"
      end
    end
  end

  #Осуществить депозит
  def deposit
    puts "Введите сумму: "
    sum = gets.to_i
    if sum < 0
      while sum < 0
        puts "Ошибка! Вы не можете ввести отрицательную сумму. Попробуйте еще раз."
        sum = gets.to_i
      end
    end
    @balance = @balance + sum
    File.write(PATH_BALANCE, @balance, mode: "w")
    puts "Теперь у вас #{@balance} вечнозеленых"
  end

  #Осуществить снятие денег
  def withdraw
    puts "Введите сумму: "
    draw = gets.to_i
    if draw < 0 or draw > @balance
      while draw < 0 or draw > @balance
        puts "Невозможно вывести данную сумму. Попробуйте еще раз."
        draw = gets.to_i
      end
    end
    puts @balance
    @balance = @balance - draw
    File.write(PATH_BALANCE, "#{@balance}", mode: "w")
    puts "Теперь у вас #{@balance} вечнозеленых"
  end

  #Вывести баланс
  def show_balance
    puts "Ваш баланс: #{@balance} вечнозеленых"
  end
end
