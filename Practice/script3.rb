# コースリスト： コース ID => [ コース名, 単位数 ]
courses = [
  { 'M2001' => %w(数学２-１ 4) },
  { 'E1001' => %w(英語１ 2) },
  { 'H3001' => %w(歴史３-１ 3) }
]

# 教師リスト： 教師 ID => [ 教師名, [ 担当コース ID のリスト ] ]
teachers = [
  { 1 => ['佐藤', %w(T4004 E1001)] },
  { 2 => ['鈴木', %w(M2001 M2002)] },
  { 3 => ['田中', %w(E1001 M2001)] }
]

course_result = {}

# course_result[コースID] = コース名 に初期化
courses.each do |course|
  course.each do |course_id, course_info|
    course_result[course_id] = course_info[0]
  end
end

teacher_result = []

# teacher_result[コースID] = 教師名 に 初期化
(0...teachers.length).each do |i|
  teachers[i].each do |_teacher_id, teacher_info| # 使用しない変数には'_'を付ける

    # 教師名 ： 担当コース(Array)
    # puts "#{teacher_info[0]} : #{teacher_info[1]}"
    teacher_info[1].each do |course_id|
      # コースid, 担当教師
      teacher_result << [course_id, teacher_info[0]]
    end
  end
end

result = {}

puts "コース名 : 担当教師"
course_result.each_key do |course_id|
  (0...teacher_result.length).each do |j|
    # += 演算子が使えない？
    # result[key] += "#{teacher_result[j][1]}先生" if teacher_result[j][0] == key
    result[course_id] = "#{result[course_id]} #{teacher_result[j][1]}先生" if teacher_result[j][0] == course_id
  end
  result[course_id] = '担当がいません' if result[course_id].nil?
  puts "#{course_result[course_id]} : #{result[course_id]}"
end
