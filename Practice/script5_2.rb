require 'date'

class Teacher
  attr_reader :id
  attr_reader :name
  attr_accessor :type
  attr_reader :course_ids

  def initialize(id, name, *course_ids)
    raise '教師IDは整数で指定してください' unless id.integer? && id.nonzero?

    @id = id
    @name = name
    @course_ids = course_ids
  end

  def info
    puts "  教師ID : #{id}"
    puts "  教師名 : #{name}"
    puts "講師種別 : #{@type}"
    puts "コースID : #{@course_ids.join(',')}"
  end
end

class FullTimeTeacher < Teacher
  def initialize(id, name, *course_ids)
    super(id, name, course_ids)
    @type = '専任'
  end
end

class PartTimeTeacher < Teacher
  attr_accessor :work_days

  def initialize(id, name, *course_ids)
    super(id, name, course_ids)
    @type = '非常勤'
  end

  def work_days(*work_days)
    work_days.each do |d|
      raise '正しい曜日を英語で指定してください（ex: Tue)' unless Date::ABBR_DAYNAMES.include?(d)
    end
    @work_days = work_days
  end

  def info
    super
    puts "　出勤日 : #{@work_days.join(',')}"
  end
end

teacher1 = FullTimeTeacher.new(1, '佐藤', 'T4004', 'E1001')
teacher2 = PartTimeTeacher.new(2, '鈴木', 'M2001', 'M2002')
teacher2.work_days('Tue', 'Wed', 'Sun')
teacher3 = FullTimeTeacher.new(3, '田中', 'E1001', 'M2001')
puts teacher1.info
puts teacher2.info
puts teacher3.info

# teacher2.work_days('Test') # => 例外発生
# teacher4 = Teacher.new(0, '田中', 'E1001', 'M2001') # => 例外発生
