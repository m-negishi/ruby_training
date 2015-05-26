email = 'rubyist@ruby.example.com'

# # 英数字、記号()、大文字小文字の区別なし
# user_pattern = /(\w)+\Z@/i
# user_pattern =~ email
# puts $&
# 上記のように、バリデーションをかけたいわけじゃない

/(.+)@(.+)/ =~ email
user = $1
host = $2

puts "アドレス：#{email}"
puts "ユーザ部：#{user}"
puts "ホスト部：#{host}"
