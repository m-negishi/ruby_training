require 'test/unit'
require File.join(File.dirname(__FILE__), './script2_2_2')

class PersonTest < Test::Unit::TestCase

  def setup
    @strength = 10
    @cleverness = 10
    @person = Person.new(@strength, @cleverness)
  end

  def test_new
    assert_equal @strength, @person.strength
    assert_equal @strength, @person.cleverness
  end

end

class FighterTest < Test::Unit::TestCase

  def setup
    @strength = 10
    @cleverness = 10
    @fighter = Fighter.new(@strength, @cleverness)
  end

  def test_strength_input_should_be_base_strength
    assert_equal @strength, @fighter.base_strength
  end

  def test_strength_should_be_one_point_five_times_base_strength
    assert_equal @fighter.strength, @fighter.base_strength * 1.5
  end

  def test_cleverness_should_be_cleverness_input
    assert_equal @fighter.cleverness, @cleverness
  end

end

class WizardTest < Test::Unit::TestCase

  def setup
    @strength = 10
    @cleverness = 10
    @wizard = Wizard.new(@strength, @cleverness)
  end

  def test_strength_input_should_be_base_strength
    assert_equal @strength, @wizard.base_strength
  end

  def test_strength_should_be_a_half_base_strength
    assert_equal @wizard.strength, @strength * 0.5
  end

  def test_cleverness_input_should_be_base_cleverness
    assert_equal @cleverness, @wizard.base_cleverness
  end

  def test_cleverness_should_be_three_times_base_cleverness
    assert_equal @wizard.cleverness, @wizard.base_cleverness * 3
  end

end

class PriestTest < Test::Unit::TestCase

  def setup
    @strength = 10
    @cleverness = 10
    @priest = Priest.new(@strength, @cleverness)
  end

  def test_strength_should_be_strength_input
    assert_equal @priest.strength, @strength
  end

  def test_cleverness_input_should_be_base_cleverness
    assert_equal @cleverness, @priest.base_cleverness
  end

  def test_cleverness_should_be_two_times_base_cleverness
    assert_equal @priest.cleverness, @priest.base_cleverness * 2
  end

end

class BattleTest < Test::Unit::TestCase

  def setup
    @battle = Battle.new
    @fighter = Fighter.new(10, 10)
    @wizard = Wizard.new(10, 10)
    @priest = Priest.new(10, 10)
    @fighter2 = Fighter.new(10, 10)
  end

  def test_get_ralative_power_ratio
    fighter_against_wizard_st_ratio = 0.85
    fighter_against_wizard_cl_ratio = 1.0

    fighter_against_wizard_power_ratio = {
      st: fighter_against_wizard_st_ratio,
      cl: fighter_against_wizard_cl_ratio
    }

    assert_equal @battle.get_relative_power_ratio(@fighter, @wizard), fighter_against_wizard_power_ratio
  end

  def test_add_strength_and_cleverness
    power_ratio = @battle.get_relative_power_ratio(@wizard, @priest)
    wizard_power = @wizard.strength * power_ratio[:st] + @wizard.cleverness * power_ratio[:cl]

    assert_equal @battle.add_strength_and_cleverness(@wizard, power_ratio[:st], power_ratio[:cl]), wizard_power
  end

  def test_calc_power
    priest_against_fighter_st_ratio = 0.95
    priest_against_fighter_cl_ratio = 0.9

    priest_against_fighter_power_ratio = {
      st: priest_against_fighter_st_ratio,
      cl: priest_against_fighter_cl_ratio
    }

    priest_power = @battle.add_strength_and_cleverness(@priest, priest_against_fighter_power_ratio[:st], priest_against_fighter_power_ratio[:cl])

    assert_equal @battle.calc_power(@priest, @battle.get_relative_power_ratio(@priest, @fighter)), priest_power
  end

  def test_get_relative_power
    relative_power = {
      player1: @battle.calc_power(@fighter, @battle.get_relative_power_ratio(@fighter, @wizard)),
      player2: @battle.calc_power(@wizard, @battle.get_relative_power_ratio(@wizard, @fighter))
    }

    assert_equal @battle.get_relative_power(@fighter, @wizard), relative_power
  end

  def test_result_fighter_vs_wizard
    assert_equal 'Wizardの勝ち', @battle.result(@fighter, @wizard)
  end

  def test_result_wizard_vs_fighter
    assert_equal 'Wizardの勝ち', @battle.result(@wizard, @fighter)
  end

  def test_result_wizard_vs_priest
    assert_equal 'Priestの勝ち', @battle.result(@wizard, @priest)
  end

  def test_result_priest_vs_wizard
    assert_equal 'Priestの勝ち', @battle.result(@priest, @wizard)
  end

  def test_result_priest_vs_fighter
    assert_equal 'Priestの勝ち', @battle.result(@priest, @fighter)
  end

  def test_result_fighter_vs_priest
    assert_equal 'Priestの勝ち', @battle.result(@fighter, @priest)
  end

  def test_result_fighter_vs_fighter
    assert_equal '引き分け', @battle.result(@fighter, @fighter2)
  end

end
