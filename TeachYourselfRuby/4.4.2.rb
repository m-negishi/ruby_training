str = 'encoding テスト'

puts "encode: #{str.encoding}"
puts utf = str.encode('UTF-8')
puts utf.encoding
puts sjis = str.encode('Shift_JIS')
puts sjis.encoding
