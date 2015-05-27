# 2

time_now = Time.now.strftime('%P').to_s

if time_now == 'am'
  puts '午前'
else
  puts '午後'
end

# 3

require 'date'

puts Date.today >> 3
