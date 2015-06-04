require 'date'

class Teachers
  attr_accessor :list

  def initialize
    @list = {}
  end

  def set_data(id, name, type, *courses)
    raise ArgumentError, 'full_timeかpart_timeを指定してください' unless type == 'full_time' || type == 'part_time'
    @list[id] = { name: name, type: type, courses: courses }
  end

  def set_work_day(id, *work_day)
    raise StandardError, '勤務曜日を設定するのは非常勤講師のみです' unless @list[id][:type] == 'part_time'
    work_day.each do |d|
      raise ArgumentError, '正しい曜日を英語で指定してください（ex: Tue)' unless Date::ABBR_DAYNAMES.include?(d)
    end
    @list[id] = { work_day: work_day }
  end
end

teachers = Teachers.new
teachers.set_data(1, '佐藤', 'full_time', 'T4004', 'E1001')
teachers.set_data(2, '鈴木', 'part_time', 'M2001', 'M2002')
teachers.set_data(3, '田中', 'full_time', 'E1001', 'M2001')
teachers.set_work_day(2, 'Tue', 'Wed', 'Sun')
# teachers.set_data(4, '斎藤', 'full', 'E1002', 'M3001') # => ArgumentError
# teachers.set_work_day(3, 'Tue', 'Wed', 'Sun') # => StandardError
# teachers.set_work_day(2, 'Tue', 'Wed', 'Sun', 'test') # => ArgumentError
puts teachers.list # => {1=>{:name=>"佐藤", :type=>"full_time", :courses=>["T4004", "E1001"]}, 2=>{:work_day=>["Tue", "Wed", "Sun"]}, 3=>{:name=>"田中", :type=>"full_time", :courses=>["E1001", "M2001"]}}

# class FullTimeTeacher < Teachers
#   def set_data(id, name, *courses)
#     super
#     @list[id] = { type: 'full_time' }
#   end
# end
#
# class PartTimeTeacher < Teachers
#   def set_data(id, name, *courses)
#     super
#     @list[id] = { type: 'part_time' }
#   end
#
#   def set_work_day(id, *work_day)
#     @list[id] = { work_day: work_day }
#   end
# end
#
# teachers = Teachers.new
# a = FullTimeTeacher.set_data(1, '佐藤', 'T4004', 'E1001')
# b = PartTimeTeacher.set_data(2, '鈴木', 'M2001', 'M2002')
# b.set_work_day(2, 'Mon', 'Tue')
# puts teachers


# teachers.set_data(1, '佐藤', 'T4004', 'E1001')
# teachers.set_data(2, '鈴木', 'M2001', 'M2002')
# teachers.set_data(3, '田中', 'E1001', 'M2001')
