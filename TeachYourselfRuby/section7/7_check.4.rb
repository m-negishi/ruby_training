class Money
  attr_reader :currency
  def initialize(c)
    @currency = c
  end
  def eql?(other)
    other.class == self.class && other.currency == currency
  end
end

class Yen < Money
  attr_reader :value
  alias eql_currency? eql?
  def initialize(v)
    super('YEN')
    @value = v
  end

  def eql?(other)
    other.class == self.class && other.value == value
  end
end

ten1 = Yen.new(10)
ten2 = Yen.new(10)
hund = Yen.new(100)

p ten1.eql?(ten1)
p ten1.eql?(ten2)
p ten1.eql?(hund)
p ten1.eql_currency?(hund)
