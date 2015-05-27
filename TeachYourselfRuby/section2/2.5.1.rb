puts '数値を入力'
a = gets.to_i
# 例外処理不十分

if a < 0
  puts 'aは0より小さい'
elsif a == 0
  puts 'aは0'
else
  puts 'aは0より大きい'
end
