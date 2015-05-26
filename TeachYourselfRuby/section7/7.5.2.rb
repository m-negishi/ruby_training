require 'date'

module Birth
  def age
    # 今日の日付 - 誕生日 / 10000（小数点以下切り捨て）で単純な年齢を計算できる
    today = Date.today.strftime('%Y%m%d').to_i
    # birth = self.birthday.strftime('%Y%m%d').to_i
    # selfを省略すると暗黙的にselfをレシーバとする
    birth = birthday.strftime('%Y%m%d').to_i
    # 3桁以上の数値はアンダースコアで区切る（規約）
    (today - birth).div(10_000)
  end

  def coming_of_age?
    age >= 20
  end
end

class Person
  include Birth

  attr_reader :birthday

  def initialize(birth)
    @birthday = birth || Date.today # birthがnilかfalseの場合、Date.todayが代入される
  end

  # アクセスメソッドに置き換え
  # def birthday
  #   @birthday
  # end
end

p = Person.new(Date.new(1985, 10, 1))

puts p.age
puts p.coming_of_age?
