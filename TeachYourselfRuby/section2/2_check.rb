# 1
(1..100).each { |i| puts i if i % 3 == 0 }

# 2
(1..100).each do |i|
  puts i if i % 3 == 0 && i % 5 != 0
end
