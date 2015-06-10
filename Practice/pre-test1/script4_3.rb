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
  attr_reader :credits

  def initialize(id, name, credits)
    @id = id
    @name = name
    @credits = credits
  end

  def info
    puts "コースID : #{@id}"
    puts "コース名 : #{@name}"
    puts "  単位数 : #{@credits}"
  end
end

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
  attr_reader :course_ids

  def initialize(id, name, *courses)
    @id = id
    @name = name
    @course_ids = courses
  end

  def info
    puts "   教師 ID : #{id}"
    puts "　　教師名 : #{name}"
    puts "担当コース : #{course_ids.join(',')}"
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

teacher1 = Teacher.new(1, '佐藤', english.name)
teacher2 = Teacher.new(2, '鈴木', math.name)
teacher3 = Teacher.new(3, '田中', english.name, math.name)
puts teacher1.info
puts teacher2.info
puts teacher3.info

# 教師ID : 1
#  教師名 : 佐藤
# 担当コース : 英語１
#
#  教師ID : 2
#  教師名 : 鈴木
# 担当コース : 数学２-１
#
#  教師ID : 3
#  教師名 : 田中
# 担当コース : 英語１,数学２-１
