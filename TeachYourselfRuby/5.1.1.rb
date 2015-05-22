diff_seconds = Time.new(2008, 9, 10) - Time.new(2008, 2, 3)

seconds_per_day = 24 * 60 * 60

puts diff_seconds.div(seconds_per_day)
