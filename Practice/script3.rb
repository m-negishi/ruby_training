# コースリスト： コース ID => [ コース名, 単位数 ]
courses = [ { 'M2001' => [ '数学２-１', 4 ] },
{ 'E1001' => [ '英語１', 2 ] },
{ 'H3001' => [ '歴史３-１', 3 ] } ]

# 教師リスト： 教師 ID => [ 教師名, [ 担当コース ID のリスト ] ]
teachers = [ { 1 => [ '佐藤', [ 'T4004', 'E1001' ] ] },
{ 2 => [ '鈴木', [ 'M2001', 'M2002' ] ] },
{ 3 => [ '田中', [ 'E1001', 'M2001' ] ] } ]

# どのコースを誰が担当しているか出力
# コースID、コース名、担当教師名

# 「コースリスト」の内容や「教師リスト」の内容が異なっていても正しく動作するように作成する
# コース名と教師名を使って表示する
# 常にコースごとにまとめて表示されるようにする
# 教師リストにあってもコースリストに存在しないコースは表示しない

# courses.each do |course|
#   puts course
# end


# 教師毎の情報抽出
for i in 0...teachers.length do
  teachers[i].each do |id, info|
    # info.class = Array

    # 教師名　： 担当コース(Array)
    # puts "#{info[0]} : #{info[1]}"
    info[1].each do |course|
      # 教師名 : 担当コース
      # puts "#{info[0]} : #{course}"
    end
  end
end
