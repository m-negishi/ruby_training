require 'date'

class DateRange
  attr_reader :from
  attr_reader :to

  def initialize(from, to)
    self.from = from
    self.to = to
  end

  def days
    (to - from).to_i + 1
  end

  def from=(from)
    raise ArgumentError.new("from must be Date.") unless from.is_a? Date
    @from = from
  end

  def to=(to)
    raise ArgumentError.new("to must be Date.") unless to.is_a? Date
    @to = to
  end
end
