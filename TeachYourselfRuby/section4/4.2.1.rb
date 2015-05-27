str = 'I think, therefore I am.'
key = 'the'

puts "文「#{str}」"

if str.include?(key)
  puts %(#{key} は #{str.index(key) + 1} 番目にあります。)
else
  puts "#{key}はありません"
end
