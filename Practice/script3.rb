# コースリスト： コース ID => [ コース名, 単位数 ]
courses = [ { 'M2001' => [ '数学２-１', 4 ] },
            { 'E1001' => [ '英語１', 2 ] },
            { 'H3001' => [ '歴史３-１', 3 ] } ]

# 教師リスト： 教師 ID => [ 教師名, [ 担当コース ID のリスト ] ]
teachers = [ { 1 => [ '佐藤', [ 'T4004', 'E1001' ] ] },
             { 2 => [ '鈴木', [ 'M2001', 'M2002' ] ] },
             { 3 => [ '田中', [ 'E1001', 'M2001' ] ] } ]

course_id_and_course_name = {}

# course_id_and_course_name[コースID] = コース名 に初期化
courses.each do |course|
  course.each do |course_id, course_info|
    course_id_and_course_name[course_id] = course_info[0]
  end
end

course_id_and_teacher_name = []

# course_id_and_teacher_name[コースID] = 教師名 に 初期化
teachers.length.times do |i|
  teachers[i].each_value do |teacher_info|
    # 教師名 ： 担当コース(Array)
    # puts "#{teacher_info[0]} : #{teacher_info[1]}"
    teacher_info[1].each do |course_id|
      # コースid, 担当教師
      course_id_and_teacher_name << [course_id, teacher_info[0]]
    end
  end
end

course_name_and_teacher_name = {}

puts 'コース名 : 担当教師'
course_id_and_course_name.each_key do |course_id|
  teachers.length.times do |j|
    # 教師リストにあってもコースリストに存在しないコースは表示しない
    if course_id_and_teacher_name[j][0] == course_id
      # コースごとに担当をまとめる
      # course_name_and_teacher_name[key] += "#{course_id_and_teacher_name[j][1]}先生" if course_id_and_teacher_name[j][0] == key　# += 演算子が使えない？
      course_name_and_teacher_name[course_id] = "#{course_name_and_teacher_name[course_id]} #{course_id_and_teacher_name[j][1]}先生"
    end
  end
  course_name_and_teacher_name[course_id] = '担当がいません' if course_name_and_teacher_name[course_id].nil?
  puts "#{course_id_and_course_name[course_id]} : #{course_name_and_teacher_name[course_id]}"
end
