# 素数
# 約数が2つのもの

# 素数でない
# 2以外の偶数
# 素因数分解したときに、素数が因数にない
#
# エラトステネスのふるい
# Nが素数かどうかは、ルートNまでの整数で割ってみる

include Math

def prime_gen
  count = 1
  prime_list = [2]
  lambda do
    prefix = 0
    # flag = 0
    last_num = prime_list.last
    # puts "count #{count}"
    if last_num == 2
      next_prime = 3
      # puts "next_prime #{next_prime}"
      prime_list << next_prime
    else
      # puts "else"
      while prime_list.count < count
        flag = 0
        prefix += 1
        # puts "prefix = #{prefix}"
        next_prime = last_num + prefix
        # puts "next_prime = #{next_prime}"
        div = sqrt(next_prime).floor
        # puts "div = #{div}"
        # puts "next_prime.modulo(div) = #{next_prime.modulo(div)}"
        (2..div).each do |n|
          # puts "n = #{n}"
          if next_prime.modulo(n) == 0
            flag = 1
            break
          end
        end
        # puts "flag = #{flag}"
        prime_list << next_prime if flag == 0
        # puts "代入"
        # prime_list << next_prime if next_prime.modulo(div) != 0
      end
    end
    count += 1
    p prime_list# << next_prime
  end
end

# 実行
prime = prime_gen

20.times do
  prime.call
end

# 比較
require 'prime'

generator = Prime::EratosthenesGenerator.new
list = []
Prime.each(71, generator) { |prime| list << prime }
p list
