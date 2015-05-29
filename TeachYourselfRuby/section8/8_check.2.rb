# yieldを使う場合
def method1(i)
  yield(i)
end

# ブロック引数を使う場合
def method2(i, &block)
  block.call(i)
end

method1(3) { |x| puts x * x }
method2(3) { |x| puts x * x }
