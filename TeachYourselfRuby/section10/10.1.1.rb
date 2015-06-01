loop do
  print '>'
  a = gets
  break if a.chomp == 'exit'
  puts a
end
puts '終了'
