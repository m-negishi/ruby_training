# コースリスト： コース ID => [ コース名, 単位数 ]
courses = [ { 'M2001' => [ '数学２-１', 4 ] },
            { 'E1001' => [ '英語１', 2 ] },
            { 'H3001' => [ '歴史３-１', 3 ] } ]

# 教師リスト： 教師 ID => [ 教師名, [ 担当コース ID のリスト ] ]
teachers = [ { 1 => [ '佐藤', [ 'T4004', 'E1001' ] ] },
             { 2 => [ '鈴木', [ 'M2001', 'M2002' ] ] },
             { 3 => [ '田中', [ 'E1001', 'M2001' ] ] } ]

course_id_and_course = {}

# course_id_and_course[コースID] = コース名 に初期化
courses.each do |course|
  course.each do |course_id, course_info|
    course_id_and_course[course_id] = course_info[0]
  end
end

p course_id_and_course

course_id_and_teacher = []

# course_id_and_teacher[コースID] = 教師名 に 初期化
teachers.length.times do |i|
  teachers[i].each_value do |teacher_info|

    # 教師名 ： 担当コース(Array)
    # puts "#{teacher_info[0]} : #{teacher_info[1]}"
    teacher_info[1].each do |course_id|
      # コースid, 担当教師
      course_id_and_teacher << [course_id, teacher_info[0]]
    end
  end
end

p course_id_and_teacher

course_and_teacher = {}

puts "コース名 : 担当教師"
course_id_and_course.each_key do |course_id|
  course_id_and_teacher.length.times do |j|
    if course_id_and_teacher[j][0] == course_id
      if course_and_teacher[course_id].nil?
        course_and_teacher[course_id] = "#{course_id_and_teacher[j][1]}先生"
      else
        course_and_teacher[course_id] += ', ' + "#{course_id_and_teacher[j][1]}先生"
      end
    end
  end
  course_and_teacher[course_id] = '担当がいません' if course_and_teacher[course_id].nil?
  puts "#{course_id_and_course[course_id]} : #{course_and_teacher[course_id]}"
end
