# str = "printf(\"value=%d\\n\", value);"

str = %q{printf("value=%d\n", value);}
# %記法の区切り文字は非英数字ならOK
# 終わりの区切り文字は、始まりの区切り文字と対応するものにする
# http://docs.ruby-lang.org/ja/1.9.3/doc/spec=2fliteral.html#percent

puts str
