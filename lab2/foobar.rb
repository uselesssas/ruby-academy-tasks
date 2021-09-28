# Если хотя бы одно равно 20 - возвращает второе число, в противном случае выводит сумму этих чисел
def foobar(foo, bar)
  if foo == 20 || bar == 20
    bar
  else
    foo + bar
  end
end

print 'Введите 2 числа: '
print foobar(gets.to_i, gets.to_i)
