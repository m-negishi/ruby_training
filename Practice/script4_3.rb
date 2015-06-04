# # コースリスト： コース ID => [ コース名, 単位数 ]
# courses = [ { 'M2001' => [ '数学２-１', 4 ] },
#             { 'E1001' => [ '英語１', 2 ] },
#             { 'H3001' => [ '歴史３-１', 3 ] } ]
#
# # 教師リスト： 教師 ID => [ 教師名, [ 担当コース ID のリスト ] ]
# teachers = [ { 1 => [ '佐藤', [ 'T4004', 'E1001' ] ] },
#              { 2 => [ '鈴木', [ 'M2001', 'M2002' ] ] },
#              { 3 => [ '田中', [ 'E1001', 'M2001' ] ] } ]

class Course
  attr_reader :id
  attr_reader :name
  attr_reader :credit

  def initialize(id, name, credit)
    @id = id
    @name = name
    @credit = credit
  end

  def info
    puts "コースid : #{@id}"
    puts "コース名 : #{@name}"
    puts "  単位数 : #{@credit}"
  end
end

math = Course.new('M2001', '数学２-１', 4)
english = Course.new('E1001', '英語１', 2)
history = Course.new('H3001', '歴史３-１', 3)
puts math.info
puts english.info
puts history.info

# コースid : M2001
# コース名 : 数学２-１
#   単位数 : 4
#
# コースid : E1001
# コース名 : 英語１
#   単位数 : 2
#
# コースid : H3001
# コース名 : 歴史３-１
#   単位数 : 3

class Teacher
  attr_reader :id
  attr_reader :name
  attr_reader :course_id

  def initialize(id, name, *course_id)
    @id = id
    @name = name
    @course_id = course_id
  end

  def info
    puts " 教師ID : #{id}"
    puts "  教師名 : #{name}"
    puts "コースid : #{course_id.join(',')}"
  end
end

teacher1 = Teacher.new(1, '佐藤', 'T4004', 'E1001')
teacher2 = Teacher.new(2, '鈴木', 'M2001', 'M2002')
teacher3 = Teacher.new(3, '田中', 'E1001', 'M2001')
puts teacher1.info
puts teacher2.info
puts teacher3.info

# 教師ID : 1
#   教師名 : 佐藤
# コースid : T4004,E1001
#
#  教師ID : 2
#   教師名 : 鈴木
# コースid : M2001,M2002
#
#  教師ID : 3
#   教師名 : 田中
# コースid : E1001,M2001
