class MyArray
  def initialize(ary)
    @ary = ary
  end
  def each1
    i = 0
    while i < @ary.size
      yield(@ary[i])
      i += 1
    end
  end
  def select1
    result = []
    each1 do |j|
      result << j if yield(j)
    end
    p result
  end

  def each2(&block)
    i = 0
    while i < @ary.size
      block.call(@ary[i])
      i += 1
    end
  end

  def select2(&block)
    result = []
    each2 do |j|
      result << j if block.call(j)
    end
    p result
  end
end

list = MyArray.new([7, 6, 9, 4, 2, 10, 3, 1, 5, 8])
list.select1 { |i| i % 3 == 0 }
list.select2 { |i| i % 3 == 0 }
