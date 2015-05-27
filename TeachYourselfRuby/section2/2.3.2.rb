a,b = true,false
c,d = false,true
e,f = true, true
g,h = false, false

def xor_func(a, b)
  # (a || b) && !(a && b)
  (!a && b) || (a && !b)
end

p xor_func(a, b)
p xor_func(c, d)
p xor_func(e, f)
p xor_func(g, h)
