dir_list = Dir.glob("**")
dir_list.each { |f|
  unless File.directory?(f)
    puts "+- #{f}"
  else
    puts "+- #{f}/"
  end
}
