def dir_list(indent, wd)
  Dir.glob("#{wd}/**").each { |f|
    basename = File.basename(f)
    prefix = ''
    indent.times {prefix += '|  '}
    prefix += '+- '
    unless File.directory?(f)
      puts "#{prefix}#{basename}"
    else
      puts "#{prefix}#{basename}/"
      dir_list(indent + 1, f)
    end
  }
end

dir_list(0, '.')
