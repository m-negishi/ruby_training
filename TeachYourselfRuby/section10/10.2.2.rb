File.open("month.txt", 'r') do |f|
  lines = f.readlines
  (1..12).each do |m|
    puts "#{m} #{lines[m-1]}"
  end
end
