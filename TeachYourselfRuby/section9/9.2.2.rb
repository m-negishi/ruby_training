filename = 'example.txt'
begin
  f = File.open(filename, 'w')
rescue
  puts 'エラーが発生しました'
else
  puts 'ファイルを開きました'
  f.puts 'test'
ensure
  f.close if f
  puts 'ファイルを閉じました'
end
