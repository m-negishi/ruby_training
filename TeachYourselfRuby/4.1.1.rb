a = 5.5
str = <<-EOF
数値 #{a} の場合、
round(#{a}) = #{a.round}
ceil(#{a}) = #{a.ceil}
floor(#{a}) = #{a.floor}
になります。
EOF

puts str
