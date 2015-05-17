# 標準入力を行う場合は下記
# puts '1つ目の整数を入力'
# a = gets
# until a.integer? do
#   puts '整数を入力してください'
#   a = gets
# end
#
# puts '演算子を入力'
# operator = gets.to_s
#
# puts '2つ目の整数を入力'
# b = gets
# until b.integer? do
#   puts '整数を入力してください'
#   b = gets
# end
#
# puts "入力した式：#{a} #{operator} #{b}"

# str = '2 たす 2'
# str = '2 ひく 2'
# str = '2 かける 2'
str = '2 わる 2'
# str = '2 あまり 2'
# str = '2 わる 0'

arr = str.split
a = arr[0].to_i
operator = arr[1]
b = arr[2].to_i

case operator
when 'たす'
  puts "#{str} = #{a + b}"
when 'ひく'
  puts "#{str} = #{a - b}"
when 'かける'
  puts "#{str} = #{a * b}"
when 'わる'
  if b.nonzero?
    puts "#{str} = #{a / b}"
  else
    puts '0では割れません'
  end
else
  puts "#{str}は計算できません"
end
