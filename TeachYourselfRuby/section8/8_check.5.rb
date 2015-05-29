# 何乗するかを保持する場合
def make_gs_gen(ft, cr)
  ans = 0
  count = 0
  lambda do
    ans = ft * (cr ** count)
    count += 1
    ans
  end
end

# 今の解答を保持する場合
# def make_gs_gen(ft, cr)
#   ans = 0
#   lambda do
#     if ans != 0
#       ans *= cr
#     else
#       ans = ft
#     end
#   end
# end

gen1 = make_gs_gen(1, 2) # 初項1, 公比2
gen2 = make_gs_gen(10, 10) # 初項10, 公比10

puts gen1.call
puts gen1.call
puts gen1.call
puts gen2.call
puts gen2.call
puts gen2.call
