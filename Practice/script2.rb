pattern = /\d+.*\.(txt|html|css|md)$/

Dir.glob('*', File::FNM_DOTMATCH).each do |file|
  next if File.directory?(file) == true
  puts file if pattern =~ file
end
