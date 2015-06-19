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

class Priest < Person
  alias base_cleverness cleverness

  def cleverness
    @cleverness * 2
  end
end

class Battle
  attr_reader :relative_power_matrix

  def initialize
    @relative_power_matrix = {
      'Fighter':
        {
          'Fighter': { st: 1.0, cl: 1.0 },
          'Wizard': { st: 0.85, cl: 1.0 },
          'Priest': { st: 1.0, cl: 1.0 }
        },
      'Wizard':
        {
          'Fighter': { st: 1.0, cl: 1.0 },
          'Wizard': { st: 1.0, cl: 1.0 },
          'Priest': { st: 1.0, cl: 0.75 }
        },
      'Priest':
        {
          'Fighter': { st: 0.95, cl: 0.9 },
          'Wizard': { st: 1.0, cl: 1.0 },
          'Priest': { st: 1.0, cl: 1.0 }
        }
    }
  end

  def result(player1, player2)
    result = versus(player1, player2)
    puts "#{player1.class}=#{result[:player1]} vs #{player2.class}=#{result[:player2]}"

    if result[:player1] > result[:player2]
      puts "#{player1.class}の勝ち"
    elsif result[:player1] < result[:player2]
      puts "#{player2.class}の勝ち"
    else
      puts '引き分け'
    end
  end

  def versus(player1, player2)
    power = {}

    power[:player1] = calc_power(player1, relative_power_ratio(player1, player2))
    power[:player2] = calc_power(player2, relative_power_ratio(player2, player1))
    power
  end

  def calc_power(player, relative_power_ratio)
    add_strength_and_cleverness(player, relative_power_ratio[:st], relative_power_ratio[:cl])
  end

  def add_strength_and_cleverness(player, st_ratio, cl_ratio)
    player.strength * st_ratio + player.cleverness * cl_ratio
  end

  def relative_power_ratio(player1, player2)
    @relative_power_matrix[:"#{player1.class}"][:"#{player2.class}"]
  end
end

# 実行
f = Fighter.new(10, 10)
w = Wizard.new(10, 10)
p = Priest.new(10, 10)

battle = Battle.new
battle.result(f, w)
battle.result(w, f)
battle.result(w, p)
battle.result(p, w)
battle.result(p, f)
battle.result(f, p)
battle.result(f, f)
battle.result(w, w)
battle.result(p, p)
