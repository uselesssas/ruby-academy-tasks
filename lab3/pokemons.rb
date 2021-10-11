def add_pokemon(pokemons = [])
  puts 'Сколько добавить покемонов?'
  count = gets.to_i
  count.times do
    pokemon = {}
    print 'Введите имя покемона: '
    pokemon[:name] = gets.chomp
    print 'Введите цвет покемона: '
    pokemon[:color] = gets.chomp
    pokemons << pokemon
  end
  pokemons
end

p add_pokemon
