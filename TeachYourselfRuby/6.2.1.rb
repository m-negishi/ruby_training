# keyをシンボル(文字列)としてhash生成
japanese_months = { '1': '睦月', '2': '如月', '3': '弥生', '4': '卯月', '5': '皐月', '6': '水無月', '7': '文月', '8': '葉月', '9': '長月', '10': '神無月', '11': '霜月', '12': '師走' }

(1..12).each do |month|
  # 数値をシンボルに変換するために一度文字列に変換
  month_symbol = month.to_s.intern
  puts "#{month}月は #{japanese_months[month_symbol]} です"
end

# keyを数値としてhash生成（シンボルとしてはhash生成できない）
jm = { 1 => '睦月', 2 => '如月', 3 => '弥生', 4 => '卯月', 5 => '皐月', 6 => '水無月', 7 => '文月', 8 => '葉月', 9 => '長月', 10 => '神無月', 11 => '霜月', 12 => '師走' }

(1..12).each do |month|
  puts "#{month}月は #{jm[month]} です"
end


# hashのkeyに数値を使う
#
#
# # p h1 = { 1: 'one', 2: 'two' } # keyが数値だとシンボルにできないのでエラー
puts "h2 = #{h2 = { '1': 'one', '2': 'two'}}" # keyが文字列ならOK
puts "h3 = #{h3 = { 1 => 'one', 2 => 'two' }}" # 1.8系の書き方なら数値でOK
# p h4 = { :1 => 'one', :2 => 'two'} # h1同様に数値クラスはシンボルにできない
# p symbol = 1.intern # internはStringクラスのメソッド
#
puts "symbol = #{symbol1 = 1.to_s.intern}"
puts "symbol2 = #{symbol2 = 2.to_s.intern}"
puts "h2[symbol1] = #{h2[symbol1]}" # keyが文字列ならシンボルで指定できる
puts "h3[symbol2] = #{h3[symbol2]}" # keyが数値なのでシンボルにすると一致しない
puts "h3[1] = #{h3[1]}" # keyを数値で指定してやれば参照できる
