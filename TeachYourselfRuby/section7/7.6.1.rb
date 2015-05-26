class Person
  attr_reader :bloodtype

  def initialize(b)
    @bloodtype = b
  end
end

class << Person
  def compatibility(person1, person2)
    matrix = {
      'A': { 'A': 75, 'B': 50, 'O': 95, 'AB': 40 },
      'B': { 'A': 50, 'B': 75, 'O': 75, 'AB': 90 },
      'O': { 'A': 95, 'B': 75, 'O': 65, 'AB': 50 },
      'AB': { 'A': 40, 'B': 90, 'O': 50, 'AB': 70 }
    }

    matrix[:"#{person1.bloodtype}"][:"#{person2.bloodtype}"]
  end
end

a = Person.new('A')
b = Person.new('B')
o = Person.new('O')
ab = Person.new('AB')

puts Person.compatibility(a, b)
puts Person.compatibility(o, ab)
