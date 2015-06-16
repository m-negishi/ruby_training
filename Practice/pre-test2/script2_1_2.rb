# 素数：約数が2つの数
def prime_gen
  prime_list = []

  lambda do
    if prime_list.last.nil?
      prime_list << 2
    elsif prime_list.last == 2
      prime_list << 3
    else
      # 素数になり得るのは奇数のみなので2を加算
      next_prime = prime_list.last + 2
      catch(:finish_check) do
        loop do
          catch(:check_prime) do
            # 全ての奇数で割ろうとしたが
            # 既に素数でない奇数で割る必要がない
            prime_list.each do |num|
              if next_prime % num == 0
                next_prime += 2
                throw :check_prime
              end
            end
            prime_list << next_prime
            throw :finish_check
          end
        end
      end
    end
    p prime_list
  end
end

# 実行
prime = prime_gen

20.times { prime.call }
