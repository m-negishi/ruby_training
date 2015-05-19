dir_array = Dir.glob('*')

# 数字を含み、'-','_', '.', ' ', 英数字が0回以上
pattern = /(\w|\_|\-|\.|\s)*\d(\w|\_|\-|\.|\s)*\.(txt|html|css|md)/

dir_array.each do |dir|
  # ディレクトリは取り除く
  # http://docs.ruby-lang.org/ja/2.2.0/class/Dir.html
  puts dir if pattern =~ dir && File.directory?(dir) != true
end
