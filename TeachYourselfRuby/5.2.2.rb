require 'date'

d = Date.new(2008, 1, 1)
# d = Date.new(2009, 1, 1)

if d.leap?
  puts "#{d.year}年はうるう年です"
else
  puts "#{d.year}年はうるう年ではありません"
end
