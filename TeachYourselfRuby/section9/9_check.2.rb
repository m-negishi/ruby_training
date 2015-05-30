class Person
  def age
    @age
  end

  def age=(age)
    raise ArgumentError, '整数ではありません' unless age.integer?
    # raise ArgumentError, '整数ではありません' unless age.is_a?(Integer)
    raise ArgumentError, '正の数ではありません' unless age >= 0
    @age = age
  end
end

person = Person.new
person.age = 20.1
puts person.age
