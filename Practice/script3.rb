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

courses.each do |course|
  course.each_key do |key|
    # コースID : コース情報
    # puts "#{key} : #{courseInfo}"
    course_result[key] = nil
  end
end

# 教師毎の情報抽出
teacher_result = []

(0...teachers.length).each do |i|
  teachers[i].each do |_teacher_id, teacher_info| # 使用しない変数には'_'を付ける
    # info.class = Array

    # 教師名 ： 担当コース(Array)
    # puts "#{teacher_info[0]} : #{teacher_info[1]}"
    teacher_info[1].each do |has_course|
      # 教師名 : 担当コース
      # puts "#{teacher_info[0]} : #{has_course}"

      # コース名, 担当教師
      teacher_result << [has_course, teacher_info[0]]
    end
  end
end

# まだコース名でまとめて教師を吐き出せていない
course_result.each_key do |key|
  (0...teacher_result.length).each do |j|
    puts "#{key} : #{teacher_result[j][1]}" if teacher_result[j][0] == key
  end
end
