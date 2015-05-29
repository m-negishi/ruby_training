def method2(n)
  if defined? yield
    yield(n)
  else
    puts n
  end
end

method2(3) { |x| puts x * x }
method2(2)
