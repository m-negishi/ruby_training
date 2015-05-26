arr = [1, 10, 12, 3, 8, 90, 34, 82]

puts "昇順 #{arr.sort}"
puts "降順 #{arr.sort.reverse}"

sum = 0

arr.each do |val|
  sum += val
end

puts "合計値 #{sum}"
puts "平均値 #{sum.to_f.quo(arr.length)}"
