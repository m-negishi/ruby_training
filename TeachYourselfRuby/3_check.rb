# b = 1
c = 1.0 / 0
# d = -1.0 / 0
# e = 0.0 / 0

# a = b
a = c
# a = d
# a = e

if a.integer?
  puts 'aは整数'
elsif a.infinite?
  puts 'aは無限大'
elsif a.nan?
  puts 'aは数値ではない'
end
