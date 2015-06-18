require 'test/unit'
require './lib/date_range'
# require File.join(File.dirname(__FILE__), '../lib/date_range')


class DateRangeTest < Test::Unit::TestCase

  def test_new
    from = Date.new(2008, 9, 9)
    to = Date.new(2008, 9, 10)
    dr = DateRange.new(from, to)

    assert_equal from, dr.from
    assert_equal to, dr.to
  end
end
