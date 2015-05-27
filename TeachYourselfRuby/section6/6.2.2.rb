words = {}

loop do
  puts "English> #{e_word = gets}"
  # 改行を削除
  e_word.chomp!

  break if e_word == 'END'

  puts "日本語> #{j_word = gets}"
  j_word.chomp!
  # hashに格納
  words[e_word] = j_word
end

words.each do |e, j|
  puts "#{e} : #{j}"
end
