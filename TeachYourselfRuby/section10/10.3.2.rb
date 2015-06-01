print 'file> '
filename = gets
filename.chomp!
if File.exist?(filename)
  File.delete(filename)
  puts "#{filename} を削除しました"
else
  puts "#{filename} が存在しません"
end
