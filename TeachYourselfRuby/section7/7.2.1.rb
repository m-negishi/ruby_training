class Dog
  def initialize(k = 'Mongrel')
    @kind = k
  end

  def kind
    @kind
  end

  def kind=(k)
    @kind = k
  end
end

dog = Dog.new
puts dog.kind

dog.kind = 'Chihuahua'
puts dog.kind

dog2 = Dog.new('Papillon')
puts dog2.kind
