# Dogクラス
class Dog
  attr_reader :kind
  attr_writer :meal

  def initialize(k = 'Mongrel')
    @kind = k
    @meal = nil
  end

  # アクセスメソッドで代替
  # def kind
  #   @kind
  # end

  # def kind=(k)
  #   @kind = k
  # end

  # アクセスメソッドで代替できる
  # def meal=(food)
  #   puts 'エサを与える'
  #   @meal = food
  #
  # end

  def feeling
    if @meal.nil?
      # puts 'Sad'
      return 'Sad'
    else
      @meal = nil
      return 'Good'
    end
  end
end

dog = Dog.new('Chihuahua')
puts dog.kind
# dog.kind = 'test' # エラー
puts dog.feeling # Sad
dog.meal = 'dogfood' # エサを与える
puts dog.feeling # Good
puts dog.feeling # Sad
