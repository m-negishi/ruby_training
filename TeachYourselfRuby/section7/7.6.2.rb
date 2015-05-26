class Person
  attr_reader :strength
  attr_reader :cleverness

  def initialize(st, cl)
    @strength = st
    @cleverness = cl
  end
end
