puts 'for文の場合'

for i in 1..100
  puts i
end

puts 'eachメソッドの場合'

(1..100).each { |i| puts i }

puts 'timesメソッドの場合'

# 100.times do |i|
#   puts i
# end

100.times { |i| puts i + 1 }
