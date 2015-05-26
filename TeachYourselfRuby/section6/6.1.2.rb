a = [1, 2, 3, 4, 5, 6, 7, 8, 9]
b = []

# (0...a.length - 2).each do |i|
#   b << [a[i], a[i + 1], a[i + 2]]
# end

i = 0
while i < a.length - 2
  # a[開始位置, 長さ]で、返り値は配列
  b << a[i, 3]
  i += 1
end

puts b.inspect

# 実行例
# [ [1, 2, 3], [2, 3, 4], [3, 4, 5] ... ]
