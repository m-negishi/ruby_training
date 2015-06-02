# # コースリスト： コース ID => [ コース名, 単位数 ]
# courses = [ { 'M2001' => [ '数学２-１', 4 ] },
#             { 'E1001' => [ '英語１', 2 ] },
#             { 'H3001' => [ '歴史３-１', 3 ] } ]
#
# # 教師リスト： 教師 ID => [ 教師名, [ 担当コース ID のリスト ] ]
# teachers = [ { 1 => [ '佐藤', [ 'T4004', 'E1001' ] ] },
#              { 2 => [ '鈴木', [ 'M2001', 'M2002' ] ] },
#              { 3 => [ '田中', [ 'E1001', 'M2001' ] ] } ]

class Courses
  attr_accessor :list

  def initialize
    @list = {}
  end

  def set_data(id, name, credit)
    @list[id] = { name: name, credit: credit }
  end

  # def find_by_id(id)
  #   @list[id]
  # end
end

courses = Courses.new
courses.set_data('M2001', '数学２-１', 4)
courses.set_data('E1001', '英語１', 2)
courses.set_data('H3001', '歴史３-１', 3)
puts courses.list
# puts courses.find_by_id('M2001')

class Teachers
  attr_accessor :list

  def initialize
    @list = {}
  end

  def set_data(id, name, *courses)
    @list[id] = { name: name, courses: courses }
  end

  # def find_by_id(id)
  #   @list[id]
  # end
end

teachers = Teachers.new
teachers.set_data(1, '佐藤', 'T4004', 'E1001')
teachers.set_data(2, '鈴木', 'M2001', 'M2002')
teachers.set_data(3, '田中', 'E1001', 'M2001')
puts teachers.list

# teachers.list.each {|l| puts l}
