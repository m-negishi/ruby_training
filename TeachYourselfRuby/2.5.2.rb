puts '1~12までの数値を入力'

month = gets.to_i

case month
when 1
  puts 'January'
when 2
  puts 'February'
when 3
  puts 'March'
when 4
  puts 'April'
when 5
  puts 'May'
when 6
  puts 'June'
when 7
  puts 'July'
when 8
  puts 'Augues'
when 9
  puts 'September'
when 10
  puts 'October'
when 11
  puts 'November'
when 12
  puts 'December'
else
  puts 'isn\'t month'
end
