puts '1以上の整数を入力してください'
num = gets.to_i

init_num = [1, 1]
fibonacci = []

if num == 1 || num == 2
  (0..num - 1).each do |i|
    fibonacci[i] = init_num[i]
  end
elsif num > 2
  fibonacci = init_num
  (2..num - 1).each do |i|
    fibonacci[i] = fibonacci[i - 2] + fibonacci[i - 1]
  end
else
  puts '1以上の整数を入力してください'
end

puts 'fibonacci = ' << fibonacci.to_s
