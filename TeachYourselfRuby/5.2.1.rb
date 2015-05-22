require 'date'

day1 = Date.new(2008, 2, 3)
day2 = Date.new(2008, 9, 10)
diff_days = day2 - day1

puts diff_days.to_i #to_sだと`220/1`となる
