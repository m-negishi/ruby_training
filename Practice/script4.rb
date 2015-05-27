# # コースリスト： コース ID => [ コース名, 単位数 ]
# courses = [ { 'M2001' => [ '数学２-１', 4 ] },
#             { 'E1001' => [ '英語１', 2 ] },
#             { 'H3001' => [ '歴史３-１', 3 ] } ]
#
# # 教師リスト： 教師 ID => [ 教師名, [ 担当コース ID のリスト ] ]
# teachers = [ { 1 => [ '佐藤', [ 'T4004', 'E1001' ] ] },
#              { 2 => [ '鈴木', [ 'M2001', 'M2002' ] ] },
#              { 3 => [ '田中', [ 'E1001', 'M2001' ] ] } ]

class SetData
  attr_accessor :list

  def initialize
    @list = []
  end

  def set(id, name, data)
    @list << { id => [name, data] }
  end
end

class Courses < SetData
  # attr_accessor :list
  #
  # def initialize
  #   @list = []
  # end
  #
  # def set(id, name, credit)
  #   @list << { id => [name, credit] }
  # end
end

courses = Courses.new
courses.set('M2001', '数学２-１', 4)
courses.set('E1001', '英語１', 2)
courses.set('H3001', '歴史３-１', 3)
p courses.list

class Teachers < SetData
  def set(id, name, *course_id)
    @list << { id => [name, course_id] }
  end
end


# class Teachers
#   attr_accessor :list
#
#   def initialize
#     @list = []
#   end
#
#   def set(id, name, *course_id)
#     @list << { id => [name, course_id] }
#   end
# end

teachers = Teachers.new
teachers.set(1, '佐藤', 'T4004', 'E1001')
teachers.set(2, '鈴木', 'M2001', 'M2002')
teachers.set(3, '田中', 'E1001', 'M2001')
p teachers.list
