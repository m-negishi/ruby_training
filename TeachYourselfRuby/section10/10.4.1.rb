print 'directory> '
dirname = gets
dirname.chomp!
if Dir.exist?(dirname)
  puts "#{dirname} は既に存在します"
else
  Dir.mkdir(dirname)
  puts "#{dirname} を作成しました"
end
