require 'prime'

def prime_gen
  prime_list = []
  generator = Prime::EratosthenesGenerator.new

  lambda { p prime_list << generator.next }
end

prime = prime_gen

prime.call
prime.call
prime.call
prime.call
