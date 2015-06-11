# 素数
# 約数が2つのもの

# 素数でない
# 2以外の偶数
# 素因数分解したときに、素数が因数にない
#
# エラトステネスのふるい
# Nが素数かどうかは、Nの平方根までの整数で割ってみる

include Math

def prime_gen
  count = 1
  prime_list = []

  lambda do
    prefix = 0
    last_prime = prime_list.last
    # 2と3は例外的に処理
    if last_prime.nil?
      prime_list << 2
    elsif last_prime == 2
      prime_list << 3
    else
      while prime_list.count < count
        judge_prime = 0
        # 2以外の偶数は素数ではないので奇数だけ生成
        prefix += 2
        next_prime = last_prime + prefix

        (3..sqrt(next_prime).floor).each do |n|
          if next_prime.modulo(n) == 0
            judge_prime = 1
            # 一度でも割り切れたら素数ではない
            break
          end
        end

        prime_list << next_prime if judge_prime == 0
      end
    end

    count += 1
    p prime_list
  end
end

#
#
# 実行
prime = prime_gen

20.times do
  prime.call
end

# 比較用
require 'prime'

generator = Prime::EratosthenesGenerator.new
list = []
Prime.each(71, generator) { |prime_num| list << prime_num }
p list
