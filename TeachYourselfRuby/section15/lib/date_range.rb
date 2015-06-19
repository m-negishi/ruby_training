require 'date'

class DateRange
  attr_reader :from
  attr_accessor :to

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
end
