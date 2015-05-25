foods = {
  '1': 'カレー',
  '2': 'グラタン',
  '3': 'ラーメン',
  '4': 'ハンバーグ',
  '5': 'ライチ',
  '6': 'メロン',
  '7': 'うどん',
  '8': 'パスタ',
  '9': '焼き肉',
  '10': 'お茶漬け'
}

foods.each do |num, food|
  puts "#{num} 番目の好きなものは #{food}"
end

num1 = 2
num2 = 7
num1_symbol = num1.to_s.intern
num2_symbol = num2.to_s.intern

puts "#{foods[num1_symbol]}と、#{foods[num2_symbol]}は一緒に食べる"
