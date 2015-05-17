tel1 = '03-1234-5678'
tel2 = '080-1234-5678'
tel3 = '012-345-6789'
tel4 = '0123-45-6789'

# 電話番号
# http://www.soumu.go.jp/main_sosiki/joho_tsusin/top/tel_number/q_and_a.html
# 0:国内プレフィックス、市外局番:1(伊豆大島、硫黄島)〜4桁、市内局番：4〜1桁
tel_pattern = /^0(\d{1,4}-\d{1,4})-\d{4}/

tel1.match(tel_pattern)
puts $&

tel2.match(tel_pattern)
puts $&

tel3.match(tel_pattern)
puts $&

tel4.match(tel_pattern)
puts $&

# メールアドレス
mail1 = 'sample@sample.com'
mail2 = 'sample@sample.co.jp'
mail3 = 'sam-ple@sam-ple.com'

# メールパターン
# Yahoo Japan参考
# http://www.yahoo-help.jp/app/answers/detail/p/6624/a_id/47376/~/%E3%83%A1%E3%83%BC%E3%83%AB%E3%82%A2%E3%83%89%E3%83%AC%E3%82%B9%E3%81%AB%E4%BD%BF%E3%81%88%E3%81%AA%E3%81%84%E6%96%87%E5%AD%97%E3%82%84%E8%A8%98%E5%8F%B7%E3%81%AF%E3%81%82%E3%82%8A%E3%81%BE%E3%81%99%E3%81%8B
# ・アルファベット : 半角小文字でa～zまでの26文字
# ・数字 :半角で0～9までの10字
# ・記号 :半角で “.”(ピリオド)、“-”(ハイフン)、“_”(アンダーバー)の3種類
# メールアドレスは上記の文字と記号を組み合わせて1字以上32字以内
# ・記号で始まるアドレスは不可
# ・「.」「-」の連続使用は不可

mail_pattern = /^\w+(\w?\.?\-?\_?)*@(\w?\.?\-?\_?)+\.([a-z])+(\.([a-z]+))?/

mail1.match(mail_pattern)
puts $&

mail2.match(mail_pattern)
puts $&

mail3.match(mail_pattern)
puts $&
