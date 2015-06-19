require 'test/unit'
require './lib/date_range'
# require File.join(File.dirname(__FILE__), '../lib/date_range')


class DateRangeTest < Test::Unit::TestCase

  # 各メソッドが実行される前に実行される
  def setup
    # puts 'setup method'
    @from = Date.new(2008, 9, 9)
    @to = Date.new(2008, 9, 10)
    @dr = DateRange.new(@from, @to)
  end

  def test_from_should_be_date
    # puts 'test_from_should_be_date'
    # puts self.object_id
    from = '2008/9/9'
    to = Date.new(2008, 9, 10)
    assert_raise(ArgumentError) do
      dr = DateRange.new(from, to)
    end
  end

  def test_from_should_be_date2
    # puts 'test_from_should_be_date2'
    # puts self.object_id
    assert_raise(ArgumentError) do
      @dr.from = "2008/9/9"
    end
  end

  def test_new
    # puts 'test_new'
    assert_equal @from, @dr.from
    assert_equal @to, @dr.to
  end

  def test_days_should_be_integer
    assert_kind_of Integer, @dr.days
  end

  def test_days_should_be_two
    assert_equal 2, @dr.days
  end

  # 各メソッドの実行後に毎回実行される
  def teardown
    # puts 'teardown'
  end
end
