# コースリスト： コース ID => [ コース名, 単位数 ]
courses = [ { 'M2001' => [ '数学２-１', 4 ] },
            { 'E1001' => [ '英語１', 2 ] },
            { 'H3001' => [ '歴史３-１', 3 ] } ]

# 教師リスト： 教師 ID => [ 教師名, [ 担当コース ID のリスト ] ]
teachers = [ { 1 => [ '佐藤', [ 'T4004', 'E1001' ] ] },
             { 2 => [ '鈴木', [ 'M2001', 'M2002' ] ] },
             { 3 => [ '田中', [ 'E1001', 'M2001' ] ] } ]

courses.each do |course|
  course.each do |c_id, c_name|
    print "#{c_name[0]} : "
    teachers.each do |teacher|
      teacher.each_value do |teacher_course|
        print "#{teacher_course[0]}先生 " if teacher_course[1].include?(c_id)
      end
    end
    print "\n"
  end
end
