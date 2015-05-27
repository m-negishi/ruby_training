class Person
  attr_reader :strength
  attr_reader :cleverness

  def initialize(st, cl)
    @strength = st
    @cleverness = cl
  end
end

class Fighter < Person
  alias base_strength strength

  def strength
    @strength * 1.5
  end
end

class Wizard < Person
  alias base_strength strength
  alias base_cleverness cleverness

  def strength
    @strength * 0.5
  end

  def cleverness
    @cleverness * 3
  end
end

f = Fighter.new(10, 10)
puts f.strength
puts f.base_strength
#
w = Wizard.new(10, 10)
puts w.cleverness
puts w.base_cleverness
