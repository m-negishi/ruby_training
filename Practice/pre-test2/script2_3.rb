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
