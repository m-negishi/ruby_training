dir_array = Dir.glob('*')
file_array = []

dir_array.each { |f| file_array.push(f) if File.directory?(f) == false }

pattern = /\d+.*\.(txt|html|css|md)$/

file_array.each { |file| puts file if pattern =~ file }
