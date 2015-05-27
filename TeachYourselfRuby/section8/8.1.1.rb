list = [7, 6, 9, 4, 2, 10, 3, 1, 5, 8]

p list.select { |value| value % 3 == 0 }

p list.collect { |value| value if value % 3 == 0 }
