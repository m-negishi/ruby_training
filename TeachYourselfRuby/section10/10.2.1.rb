require 'date'

# ファイル名はダブルクォーテーション
File.open("month.txt", 'w') do |f|
  (1..12).each do |i|
    f.puts Date::MONTHNAMES[i]
  end
end
