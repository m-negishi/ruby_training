Dir.glob("./**").each do |file|
  next unless File.file?(file)
  puts "#{File.basename(file, '.*')}\t#{File.extname(file)}"
end
