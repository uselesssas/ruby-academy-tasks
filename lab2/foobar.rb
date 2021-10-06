# Если хотя бы одно равно 20 - возвращает второе число, в противном случае выводит сумму этих чисел
def foobar(foo, bar)
  if foo == 20
    bar
  elsif bar == 20
    foo
  else
    foo + bar
  end
end

p foobar(10, 10)
