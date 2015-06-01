File.open("out.txt", 'w') do |f|
  loop do
    print '>'
    a = gets
    break if a.chomp == 'exit'
    f.puts a
  end
end
puts "#{File.size("out.txt")} byte 書き込みました"
