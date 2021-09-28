def search_letters(word)
  if word =~ /CS$/ # Если слово заканчивается на "CS"
    2**word.length
  else
    word.reverse
  end
end

print 'Введите слово: '
print search_letters(gets.chomp)
