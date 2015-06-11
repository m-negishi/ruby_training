class Person
  attr_reader :strength
  attr_reader :cleverness

  def initialize(st, cl)
    @strength = st
    @cleverness = cl
  end

  def cal_power(st_ratio=1.0, cl_ratio=1.0)
    self.strength * st_ratio + self.cleverness * cl_ratio
  end

  def cal_enemy_power(enemy, st_ratio=1.0, cl_ratio=1.0)
    enemy.strength * st_ratio + enemy.cleverness * cl_ratio
  end

  def battle(enemy)
    result(cal_power, cal_enemy_power(enemy))
  end

  def result(power, enemy_power, enemy)
    puts "#{self.class}:#{power} vs #{enemy.class}:#{enemy_power}"
    if power > enemy_power
      puts "#{self.class}の勝ち"
    elsif enemy_power > power
      puts "#{enemy.class}の勝ち"
    else
      puts "引き分け"
    end
  end
end

class Fighter < Person
  alias base_strength strength

  def strength
    @strength * 1.5
  end

  def battle(enemy)
    if enemy.class.to_s == "Wizard"
      result(cal_power(0.85, 1.0), cal_enemy_power(enemy), enemy)
    elsif enemy.class.to_s == "Priest"
      result(cal_power, cal_enemy_power(enemy, 0.95, 0.9), enemy)
    else
      super
    end
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

  def battle(enemy)
    if enemy.class.to_s == "Priest"
      result(cal_power(1.0, 0.75), cal_enemy_power(enemy), enemy)
    elsif enemy.class.to_s == "Fighter"
      result(cal_power, cal_enemy_power(enemy, 0.85, 1.0), enemy)
    else
      super
    end
  end
end

class Priest < Person
  alias base_cleverness cleverness

  def cleverness
    @cleverness * 2
  end

  def battle(enemy)
    if enemy.class.to_s == "Fighter"
      result(cal_power(0.95, 0.9), cal_enemy_power(enemy), enemy)
    elsif enemy.class.to_s == "Wizard"
      result(cal_power, cal_enemy_power(enemy, 1.0, 0.75), enemy)
    else
      super
    end
  end
end

f = Fighter.new(10, 10)
w = Wizard.new(10, 10)
p = Priest.new(10, 10)

f.battle(w)
w.battle(f)
w.battle(p)
p.battle(w)
p.battle(f)
f.battle(p)
