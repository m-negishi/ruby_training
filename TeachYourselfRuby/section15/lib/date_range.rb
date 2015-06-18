require 'date'

class DateRange
  attr_accessor :from, :to

  def initialize(from, to)
    self.from = from
    self.to = to
  end

  def days
    (to - from).to_i + 1
  end
end
