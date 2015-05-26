a = [1, 1]
5.times do
  # a_last_index = a.length - 1
  # a << a[a_last_index - 1] + a[a_last_index]
  a << a[-1] + a[-2]
end
puts a.inspect
