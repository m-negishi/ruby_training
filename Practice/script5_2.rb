require 'date'

class Teacher
  attr_reader :id
  attr_reader :name
  attr_reader :type
  attr_accessor :work_day
  attr_reader :course_id

  def initialize(id, name, type, *course_id)
    raise '専任か非常勤を指定してください' unless type == '専任' || type == '非常勤'
    raise '教師idは整数で指定してください' unless id.integer? && id.nonzero?

    @id = id
    @name = name
    @type = type
    @course_id = course_id
  end

  def info
    puts "  教師ID : #{id}"
    puts "  教師名 : #{name}"
    puts "講師種別 : #{@type}"
    puts "　出勤日 : #{@work_day.join(',')}" if @type == '非常勤'
    puts "コースid : #{@course_id.join(',')}"
  end

  def work_day(*work_day)
    raise '勤務曜日を設定するのは非常勤講師のみです' unless @type == '非常勤'
    work_day.each do |d|
      raise '正しい曜日を英語で指定してください（ex: Tue)' unless Date::ABBR_DAYNAMES.include?(d)
    end
    @work_day = work_day
  end
end

teacher1 = Teacher.new(1, '佐藤', '専任', 'T4004', 'E1001')
teacher2 = Teacher.new(2, '鈴木', '非常勤', 'M2001', 'M2002')
teacher2.work_day('Tue', 'Wed', 'Sun')
teacher3 = Teacher.new(3, '田中', '専任', 'E1001', 'M2001')
puts teacher1.info
puts teacher2.info
puts teacher3.info
# puts teacher1.work_day('Tue', 'Wed', 'Sun') # => 例外発生
# puts teacher2.work_day('Test') # => 例外発生
# teacher3 = Teacher.new(3, '田中', 'E1001', 'M2001') # => 例外発生
# teacher4 = Teacher.new(0, '田中', '専任', 'E1001', 'M2001') # => 例外発生
