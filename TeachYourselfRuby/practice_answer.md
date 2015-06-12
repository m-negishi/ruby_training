1.1

1. Rubyではプログラムをコンピュータの命令に翻訳するコンパイルが不要。そのような仕組みを何というか

  インタプリタ

1. オブジェクトとはプログラム上の何と何を一体化したものか

  データと手続き

1. Rubyのメモリ管理のうち、不要になったメモリ領域を自動で介抱する機能は

  ガベージコレクション

1. Rubyはバージョン番号によって安定版と開発版を位置づけている。

 `1.9` `1.8` `1.5` `1.8.6` `1.9.1` を安定化バージョンと開発バージョンに分類

  安定：　`1.8`, `1.8.6`, `1.9.1`

  開発：　`1.9` `1.5`


1.2

1. オブジェクトについて説明

 データと手続きを一体化したもの。オブジェクトがメッセージを受け取ると適切な手続きで処理される

1. クラスについて説明

  オブジェクトの種類を表す。同じクラスに属するオブジェクトは共通の性質を持つ（定義する）。全てのオブジェクトは何らかのクラスに属する。

3. カプセル化、ポリモーフィズム、継承について説明

 * カプセル化

    オブジェクト内のデータへの直接のアクセスを禁止
    決められた手続きでのみアクセスを許容
    （メッセージによって呼び出された手続きによってだけ、データの処理を行う。データの堅牢性を高める方法）

 * ポリモーフィズム

    同じメッセージに対する振る舞いをオブジェクトごとに分離
    メッセージの送り側から見て、オブジェクトの種類を隠蔽
    信頼性と変更容易性を高める
    （メッセージによってオブジェクトが手続きを呼び出されたとき、データの種類によって適切なものを返す）

 * 継承

    クラスには親子関係があり（クラスの階層化）、親クラス（より上位のクラス）の性質を子クラスが受け継ぐこと。


１章理解度チェック

 1. オブジェクト指向とは

  オブジェクトに注目し、オブジェクト感の相互作用により、システムの振る舞いをとらえる考え方
  （手続きとデータを一体としたオブジェクトが基本となって、カプセル化、ポリモーフィズム、継承の性質を持った考え方）

 1. Rubyが純粋オブジェクト指向言語と呼ばれるのはなぜか

  全てのものがオブジェクトから成るから


2.1

 1. リテラルとはなにか

  プログラム中に記述できる値のこと


2.2

 1. 変数に `apple` を代入し、変数の内容を表示

  ```ruby
  a = "apple"
  p a
  ```


 1. プログラムのファイル名と実行位置の行数を表示

   ```ruby
    p "ファイル名：" <<  __FILE__
    p "実行行数：" << __LINE__
   ```


2.3

 1. `10+20*4` の実行結果を120になるように変更

 ```ruby
  (10 + 20) * 4
 ```

 1. XORをNOT, AND, ORを使って表せ

  ```ruby
  (!a && b) || (a && !b)
  ```


2.4

 1. メソッド呼び出しのコード `book.title` の、`book`と`title`はそれぞれ何というか

  book ： レシーバー

  title： メソッド

 1. `a = "Ruby"`の文字列の長さをStringクラスのsizeメソッドを使って出力

  ```ruby
  a = "Ruby"
  p a.size
  ```

2.5

 1. 変数`a`の数値が「0より小さい」「0に等しい」「0より大きい」のどれに当たるかを判定し、結果を表示するプログラム

  [2.5.1.rb](./section2/2.5.1.rb)
  ```ruby
  puts '数値を入力'
  a = gets.to_i
  # 例外処理不十分

  if a < 0
    puts 'aは0より小さい'
  elsif a == 0
    puts 'aは0'
  else
    puts 'aは0より大きい'
  end
  ```

 1. 1~12の値を場合分けし、月の英語表記を表示

  [2.5.2.rb](./section2/2.5.2.rb)
  ```ruby
  puts '1~12までの数値を入力'

  month = gets.to_i

  case month
  when 1
    puts 'January'
  when 2
    puts 'February'
  when 3
    puts 'March'
  when 4
    puts 'April'
  when 5
    puts 'May'
  when 6
    puts 'June'
  when 7
    puts 'July'
  when 8
    puts 'Augues'
  when 9
    puts 'September'
  when 10
    puts 'October'
  when 11
    puts 'November'
  when 12
    puts 'December'
  else
    puts 'isn\'t month'
  end
  ```

2.6

 1. 1から100までの加算を`for`, `each`, `times`で実現

  [2.6.1.rb](./section2/2.6.1.rb)
  ```ruby
  puts 'for文の場合'

  for i in 1..100
    puts i
  end

  puts 'eachメソッドの場合'

  (1..100).each { |i| puts i }

  puts 'timesメソッドの場合'

  # 100.times do |i|
  #   puts i
  # end

  100.times { |i| puts i + 1 }

  ```

  範囲オブジェクト

   　演算子の違い

  　　`..`：範囲

  　　`...`：範囲オブジェクトが持つ最後の値が範囲に含まれない


2.7

 1. あるオブジェクトがStringクラスに属することを「このオブジェクトはStringクラスの〇〇である」と表現する

 　インスタンス

 2. 次のa, b, cオブジェクトはそれぞれどのクラスに属するか

  ```ruby
  a = [1, 2, 3] #Array
  b = 100.3 #Float
  c = {"os"=>"Linux", "arch"=>"i386", "version"=>"2.6"} #Hash
  ```

2章の理解度チェック

 [2_check.rb](./section2/2_check.rb)

 1. 1から100までの数字で、3の倍数だけ出力

 1. 1から100までの数字で、5の倍数ではないものだけ出力

 ```ruby
 # 1
 (1..100).each { |i| puts i if i % 3 == 0 }

 # 2
 (1..100).each do |i|
   puts i if i % 3 == 0 && i % 5 != 0
 end
 ```


3.1

  1. 整数のクラスと浮動小数点数のクラス

 　Integerクラス(抽象クラス)
 　　Bignumクラス
 　　Fixnumクラス

 　Floatクラス


3.2

  1. 10を3で割った商と余り

  [3.2.1.rb](./section3/3.2.1.rb)
  ```ruby
  a = 10
  b = 3

  ans = a.divmod(b)

  puts '商:' + ans[0].to_s
  puts '余り:' + ans[1].to_s
  ```

  1. 10.3 と -10.3がある。ceil, floorの結果

  ```ruby
  (10.3).ceil #11
  (10.3).floor #10
  (-10.3).ceil #-10
  (-10.3).floor #-11
  ```
  1. 10進数の255を2, 8, 16進数標記の文字列として返す

  ```ruby
  a = 255

  puts a.to_s(2)
  puts a.to_s(8)
  puts a.to_s(16)
  ```

3章理解度チェック

  [3_check.rb](./section3/3_check.rb)

  1. 5.04と5.05をそれぞれ小数点第二位で四捨五入、切り捨てる

  1. 用意されたコードに適切なメソッドを入れ、aの値が整数、無限大、数値でないかを判定

  ```ruby
  # b = 1
  c = 1.0 / 0
  # d = -1.0 / 0
  # e = 0.0 / 0

  # a = b
  a = c
  # a = d
  # a = e

  if a.integer?
    puts 'aは整数'
  elsif a.infinite?
    puts 'aは無限大'
  elsif a.nan?
    puts 'aは数値ではない'
  end  
  ```


4.1

  1. 文章を文字列に。数値や演算結果は式展開する

   [4.1.1.rb](./section4/4.1.1.rb)
   ```ruby
   a = 5.5
   str = <<-EOF
   数値 #{a} の場合、
   round(#{a}) = #{a.round}
   ceil(#{a}) = #{a.ceil}
   floor(#{a}) = #{a.floor}
   になります。
   EOF

   puts str
   ```

  1. 文字列を%記法で簡単に記述する

   [4.1.2.rb](./section4/4.1.2.rb)
   ```ruby
   # str = "printf(\"value=%d\\n\", value);"

   str = %q{printf("value=%d\n", value);}
   # %記法の区切り文字は非英数字ならOK
   # 終わりの区切り文字は、始まりの区切り文字と対応するものにする
   # http://docs.ruby-lang.org/ja/1.9.3/doc/spec=2fliteral.html#percent

   puts str
   ```

4.2

  1. 文中に「the」が含まれる場合、何文字目に来るか表示する

    [4.2.1.rb](./section4/4.2.1.rb)
    ```ruby
    str = 'I think, therefore I am.'
    key = 'the'

    puts "文「#{str}」"

    if str.include?(key)
      puts %(#{key} は #{str.index(key) + 1} 番目にあります。)
    else
      puts "#{key}はありません"
    end
    ```

  1. 文字列の連結を使って文章を作成

    [4.2.2.rb](./section4/4.2.2.rb)
    ```ruby
    star = '*'
    # puts star
    #
    # 4.times do
    #   star << star
    #   puts star
    # end

    5.times do
      puts star
      star << star
    end
    ```

4.3

  1. 郵便番号に一致する正規表現

    ```ruby
    str = '〒123-4567 東京都〇〇区'
    /\d\d\d-\d\d\d\d/ =~ str
    ```

  1. メールアドレスのユーザ部とホスト部をそれぞれ取得し、表示する

    [4.3.2.rb](./section4/4.3.2.rb)
    ```ruby
    email = 'rubyist@ruby.example.com'

    # # 英数字、記号()、大文字小文字の区別なし
    # user_pattern = /(\w)+\Z@/i
    # user_pattern =~ email
    # puts $&
    # 上記のように、バリデーションをかけたいわけじゃない

    /(.+)@(.+)/ =~ email
    user = $1
    host = $2

    puts "アドレス：#{email}"
    puts "ユーザ部：#{user}"
    puts "ホスト部：#{host}"
    ```

4.4

  1. Ruby1.8において文字列のエンコーディングを扱うグローバル変数はなにか

    `KCODE`

  1. エンコーディングUTF-8の文字列をShift-JISに変換して出力

    [4.4.2.rb](./section4/4.4.2.rb)
    ```ruby
    str = 'encoding テスト'

    puts "encode: #{str.encoding}"
    puts utf = str.encode('UTF-8')
    puts utf.encoding
    puts sjis = str.encode('Shift_JIS')
    puts sjis.encoding
    ```

4.5

  1. 文字列からシンボル、シンボルから文字列に変換するメソッド

    `intern`メソッド、`to_s`メソッド

4章理解度チェック

  1. 2つの整数と、「たす」「ひく」「かける」「わる」という日本語の演算子から計算するプログラム

    [4_check.1.rb](./section4/4_check.1.rb)
    ```ruby
    # 標準入力を行う場合は下記
    # puts '1つ目の整数を入力'
    # a = gets
    # until a.integer? do
    #   puts '整数を入力してください'
    #   a = gets
    # end
    #
    # puts '演算子を入力'
    # operator = gets.to_s
    #
    # puts '2つ目の整数を入力'
    # b = gets
    # until b.integer? do
    #   puts '整数を入力してください'
    #   b = gets
    # end
    #
    # puts "入力した式：#{a} #{operator} #{b}"

    # str = '2 たす 2'
    # str = '2 ひく 2'
    # str = '2 かける 2'
    str = '2 わる 2'
    # str = '2 あまり 2'
    # str = '2 わる 0'

    arr = str.split
    a = arr[0].to_i
    operator = arr[1]
    b = arr[2].to_i

    case operator
    when 'たす'
      puts "#{str} = #{a + b}"
    when 'ひく'
      puts "#{str} = #{a - b}"
    when 'かける'
      puts "#{str} = #{a * b}"
    when 'わる'
      if b.nonzero?
        puts "#{str} = #{a / b}"
      else
        puts '0では割れません'
      end
    else
      puts "#{str}は計算できません"
    end
    ```

  1. 正規表現で、電話番号、メールアドレスにマッチングするパターンを作成

    [4_check.2.rb](./section4/4_check.2.rb)
    ```ruby
    tel1 = '03-1234-5678'
    tel2 = '080-1234-5678'
    tel3 = '012-345-6789'
    tel4 = '0123-45-6789'

    # 電話番号
    # http://www.soumu.go.jp/main_sosiki/joho_tsusin/top/tel_number/q_and_a.html
    # 0:国内プレフィックス、市外局番:1(伊豆大島、硫黄島)〜4桁、市内局番：4〜1桁
    tel_pattern = /^0(\d{1,4}-\d{1,4})-\d{4}/

    tel1.match(tel_pattern)
    puts $&

    tel2.match(tel_pattern)
    puts $&

    tel3.match(tel_pattern)
    puts $&

    tel4.match(tel_pattern)
    puts $&

    # メールアドレス
    mail1 = 'sample@sample.com'
    mail2 = 'sample@sample.co.jp'
    mail3 = 'sam-ple@sam-ple.com'

    # メールパターン
    # Yahoo Japan参考
    # http://www.yahoo-help.jp/app/answers/detail/p/6624/a_id/47376/~/%E3%83%A1%E3%83%BC%E3%83%AB%E3%82%A2%E3%83%89%E3%83%AC%E3%82%B9%E3%81%AB%E4%BD%BF%E3%81%88%E3%81%AA%E3%81%84%E6%96%87%E5%AD%97%E3%82%84%E8%A8%98%E5%8F%B7%E3%81%AF%E3%81%82%E3%82%8A%E3%81%BE%E3%81%99%E3%81%8B
    # ・アルファベット : 半角小文字でa～zまでの26文字
    # ・数字 :半角で0～9までの10字
    # ・記号 :半角で “.”(ピリオド)、“-”(ハイフン)、“_”(アンダーバー)の3種類
    # メールアドレスは上記の文字と記号を組み合わせて1字以上32字以内
    # ・記号で始まるアドレスは不可
    # ・「.」「-」の連続使用は不可

    mail_pattern = /^\w+(\w?\.?\-?\_?)*@(\w?\.?\-?\_?)+\.([a-z])+(\.([a-z]+))?/

    mail1.match(mail_pattern)
    puts $&

    mail2.match(mail_pattern)
    puts $&

    mail3.match(mail_pattern)
    puts $&
    ```


5.1

  1. 2008/2/3 から 2008/9/10 までの日数を計算するプログラム。ただしTimeクラスを使用

    [5.1.1.rb](./section5/5.1.1.rb)
    ```ruby
    diff_seconds = Time.new(2008, 9, 10) - Time.new(2008, 2, 3)

    seconds_per_day = 24 * 60 * 60

    puts diff_seconds.div(seconds_per_day)
    ```

    1. 2009/04/10/ 12:30:00 という形式で現在日時を表示

    ```ruby
    Time.now.strftime("%Y/%m/%d %H:%M:%S")
    Time.now.strftime("%Y/%m/%d %X")
    ```

5.2

  1. 2008/2/3 から 2008/9/10 までの日数を計算するプログラム。ただしDateクラスを使用

    [5.2.1.rb](./section5/5.2.1.rb)
    ```ruby
    require 'date'

    day1 = Date.new(2008, 2, 3)
    day2 = Date.new(2008, 9, 10)
    diff_days = day2 - day1

    puts diff_days.to_i #to_sだと`220/1`となる
    ```

  1. 適切なコードを入れ、うるう年を判定して表示するプログラム

    [5.2.2.rb](./section5/5.2.2.rb)
    ```ruby
    require 'date'

    d = Date.new(2008, 1, 1)
    # d = Date.new(2009, 1, 1)

    if d.leap?
      puts "#{d.year}年はうるう年です"
    else
      puts "#{d.year}年はうるう年ではありません"
    end
    ```

5章理解度チェック

  1. 日時を取り扱うクラスと日付のみを取り扱うクラスを挙げる

    日時 Time
    日付 Date

  1. 現在の時刻を取得して、午前か午後かを表示する

  1. 3ヶ月後の日付を取得して表示

  [5_check.rb](./section5/5_check.rb)

  ```ruby
  # 2

  time_now = Time.now.strftime('%P').to_s

  if time_now == 'am'
    puts '午前'
  else
    puts '午後'
  end

  # 3

  require 'date'

  puts Date.today >> 3
  ```

6.1

  1. 適切なコードを入れて、直前の2要素の合計となる数列を作るプログラム

  [6.1.1.rb](./section6/6.1.1.rb)

  ```ruby
  a = [1, 1]
  5.times do
    # a_last_index = a.length - 1
    # a << a[a_last_index - 1] + a[a_last_index]
    # 負数のインデックスは末尾から数えた要素を指す
    a << a[-1] + a[-2]
  end
  puts a.inspect
  ```

  1. 適切なコードを入れて、1つの配列から次のように2次元配列を作るプログラム

  [6.1.2.rb](./section6/6.1.2.rb)

  ```ruby
  a = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  b = []

  # (0...a.length - 2).each do |i|
  #   b << [a[i], a[i + 1], a[i + 2]]
  # end

  i = 0
  while i < a.length - 2
    # a[開始位置, 長さ]で、返り値は配列
    b << a[i, 3]
    i += 1
  end

  puts b.inspect

  # 実行例
  # [ [1, 2, 3], [2, 3, 4], [3, 4, 5] ... ]
  ```

6.2

  1. 1〜12の数字を陰暦の月名に変換するプログラム

  [6.2.1.rb](./section6/6.2.1.rb)

  ```ruby
  # keyをシンボル(文字列)としてhash生成
  japanese_months = { '1': '睦月', '2': '如月', '3': '弥生', '4': '卯月', '5': '皐月', '6': '水無月', '7': '文月', '8': '葉月', '9': '長月', '10': '神無月', '11': '霜月', '12': '師走' }

  (1..12).each do |month|
    # 数値をシンボルに変換するために一度文字列に変換
    month_symbol = month.to_s.intern
    puts "#{month}月は #{japanese_months[month_symbol]} です"
  end

  # keyを数値としてhash生成（シンボルとしてはhash生成できない）
  jm = {
    1 => '睦月', 2 => '如月', 3 => '弥生', 4 => '卯月', 5 => '皐月', 6 => '水無月', 7 => '文月', 8 => '葉月', 9 => '長月', 10 => '神無月', 11 => '霜月', 12 => '師走'
  }

  (1..12).each do |month|
    puts "#{month}月は #{jm[month]} です"
  end

  ```

  1. 日本語と英語のキーワードを交互に入力し、入力が完了したら入力内容を一覧するプログラム（英語で「END」を入力したら完了とする）

  ```ruby
  words = {}

  loop do
    puts "English> #{e_word = gets}"
    # 改行を削除
    e_word.chomp!

    break if e_word == 'END'

    puts "日本語> #{j_word = gets}"
    j_word.chomp!
    # hashに格納
    words[e_word] = j_word
  end

  words.each do |e, j|
    puts "#{e} : #{j}"
  end
  ```

6章理解度チェック

  1. 次の数値を配列に入れて、昇順、降順で表示。合計値、平均値を表示。1, 10, 12, 3, 8, 90, 34, 82

     [6_check.1.rb](./section6/6_check.1.rb)

     ```ruby
     arr = [1, 10, 12, 3, 8, 90, 34, 82]

     puts "昇順 #{arr.sort}"
     puts "降順 #{arr.sort.reverse}"

     sum = 0

     arr.each do |val|
       sum += val
     end

     puts "合計値 #{sum}"
     puts "平均値 #{sum.to_f.quo(arr.length)}"
     ```

  1. 好きな食べ物を10個ハッシュに入れる。キーは好きな順位、値は好きな食べ物の名称。好きな食べ物を一覧で表示。また、2番目と7番目に好きなものを一緒に食べるという文字列を表示

     [6_check.2.rb](./section6/6_check.2.rb)

     ```ruby
     foods = {
       '1': 'カレー',
       '2': 'グラタン',
       '3': 'ラーメン',
       '4': 'ハンバーグ',
       '5': 'ライチ',
       '6': 'メロン',
       '7': 'うどん',
       '8': 'パスタ',
       '9': '焼き肉',
       '10': 'お茶漬け'
     }

     foods.each do |num, food|
       puts "#{num} 番目の好きなものは #{food}"
     end

     num1 = 2
     num2 = 7
     num1_symbol = num1.to_s.intern
     num2_symbol = num2.to_s.intern

     puts "#{foods[num1_symbol]}と、#{foods[num2_symbol]}は一緒に食べる"
     ```
7.1

  1. 以下のeven?メソッドがあるとき、even?(1), even?(10), even?(0)がそれぞれ何を返すか

    ```ruby
    def even?(a)
      if (a % 2) == 0
        return true
      end
      false
    end

    even?(1) = false
    even?(10) = true
    even?(0) = true
    ```

  1. 以下のように振る舞うgreetingメソッドを完成させる

    ```ruby
      greeting # => "Hello."
      greeting("Thanks") # => "Thanks."
      greeting("Thanks", "Taro") # => "Thanks, Taro"
    ```

    [7.1.2.rb](./7.1.2.rb)

    ```ruby
    def greeting(str='Hello', name=nil)
      if name.nil?
        puts "#{str}."
      else
        puts "#{str}, #{name}."
      end
    end

    greeting
    greeting('thanks')
    greeting('Test', 'negi')
    ```

7.2

  1. Dogクラスに、あらかじめkindの初期値が指定できるようにする

    [7.2.1.rb](./section7/7.2.1.rb)

    ```ruby
    class Dog
      def initialize(k = 'Mongrel')
        @kind = k
      end

      def kind
        @kind
      end

      def kind=(k)
        @kind = k
      end
    end

    dog = Dog.new
    puts dog.kind

    dog.kind = 'Chihuahua'
    puts dog.kind

    dog2 = Dog.new('Papillon')
    puts dog2.kind
    ```

  1. Dogクラスに以下の仕様を追加

    * kindメソッドはインスタンス生成時に指定し、あとは参照のみ可能

    * mealメソッドにオブジェクト（文字列）を渡すことでエサを与える

    * feelingメソッドはエサが与えられているときは'Good'を返し、エサがなくなると'Sad'を返す

    * エサを与えるとfeelingメソッドは一度だけ'Good'を返す

    [7.2.2.rb](./section7/7.2.2.rb)

    ```ruby
    class Dog
      attr_reader :kind
      attr_writer :meal

      def initialize(k = 'Mongrel')
        @kind = k
        @meal = nil
      end

      # アクセスメソッドで代替
      # def kind
      #   @kind
      # end

      # def kind=(k)
      #   @kind = k
      # end

      # アクセスメソッドで代替できる
      # def meal=(food)
      #   puts 'エサを与える'
      #   @meal = food
      #
      # end

      def feeling
        if @meal.nil?
          # puts 'Sad'
          return 'Sad'
        else
          @meal = nil
          return 'Good'
        end
      end
    end

    dog = Dog.new('Chihuahua')
    puts dog.kind
    # dog.kind = 'test' # エラー
    puts dog.feeling # Sad
    dog.meal = 'dogfood' # エサを与える
    puts dog.feeling # Good
    puts dog.feeling # Sad

    ```

7.3

  1. メソッドの可視性を変更する3つのメソッドはなにか

    public 制限なく呼び出し可能

    private 同じクラス、もしくは同じサブクラスからのみ呼び出し可能

    protected privateと同じだが、別のインスタンスでも、同じクラスもしくはサブクラスのオブジェクトであれば呼び出し可能

  1. 次のクラスのメソッドはprivate定義されているが、cookingメソッドのみpublicに変更したい。指定の位置にコードを追加して、可視性を変更する

  [7.3.2.rb](./section7/7.3.2.rb)

  ```ruby
  class Chef
    private

    def precooking
      puts '下ごしらえ'
    end

    def cooking
      precooking
      puts '調理'
      seasoning
      setout
    end

    # ここに追加
    public :cooking

    def seasoning
      puts '味付け'
    end

    def setout
      puts '盛り付け'
    end
  end
  ```

7.4

  1. 次のMyObjectクラスのmethodを呼び出すとき、太字で示したselfは何を指しているか

    ```ruby
    class MyObject
      def method
        puts self
      end
    end

    mo = MyObject.new
    mo.method
    ```

    moオブジェクトを指す


7.5

  1. モジュールの用途である「属性集約」と「機能集約」を実現するRubyのモジュール機能は何か

    属性集約 Mix-in

    機能集約 モジュール関数

  1. 以下の仕様を満たすBirthモジュールを作成

    * インクルード先のクラスにDateオブジェクトを返すbirthdayメソッド（誕生日を返す）を要求する

    * Birthモジュールは現時点での年齢を返すageメソッドを追加する

    * Birthモジュールは現時点で成人（20歳以上）かどうかを判定するcoming_of_age?メソッドを追加する

    [7.5.2.rb](./section7/7.5.2.rb)

    ```ruby
    require 'date'

    module Birth
      def age
        # 今日の日付 - 誕生日 / 10000（小数点以下切り捨て）で単純な年齢を計算できる
        today = Date.today.strftime('%Y%m%d').to_i
        # birth = self.birthday.strftime('%Y%m%d').to_i
        # selfを省略すると暗黙的にselfをレシーバとする
        birth = birthday.strftime('%Y%m%d').to_i
        # 3桁以上の数値はアンダースコアで区切る（規約）
        (today - birth).div(10_000)
      end

      def coming_of_age?
        age >= 20
      end
    end

    class Person
      include Birth

      attr_reader :birthday

      def initialize(birth)
        @birthday = birth || Date.today # birthがnilかfalseの場合、Date.todayが代入される
      end

      # アクセスメソッドに置き換え
      # def birthday
      #   @birthday
      # end
    end

    p = Person.new(Date.new(1985, 10, 1))

    puts p.age
    puts p.coming_of_age?
    ```

7.6

  1. 次のようなPersonクラスがあり、血液型を返すbloodtypeメソッドがある。このPersonクラスにPersonオブジェクトの血液型の相性を調べるクラスメソッドcompatibilityを作成する。ただし、このクラスメソッドは特異クラス定義で定義する。

  [7.6.1.rb](./section7/7.6.1.rb)

  ```ruby
  class Person
    attr_reader :bloodtype

    def initialize(b)
      @bloodtype = b
    end
  end

  class << Person
    def compatibility(person1, person2)
      matrix = {
        'A': { 'A': 75, 'B': 50, 'O': 95, 'AB': 40 },
        'B': { 'A': 50, 'B': 75, 'O': 75, 'AB': 90 },
        'O': { 'A': 95, 'B': 75, 'O': 65, 'AB': 50 },
        'AB': { 'A': 40, 'B': 90, 'O': 50, 'AB': 70 }
      }

      matrix[:"#{person1.bloodtype}"][:"#{person2.bloodtype}"]
    end
  end

  a = Person.new('A')
  b = Person.new('B')
  o = Person.new('O')
  ab = Person.new('AB')

  puts Person.compatibility(a, b)
  puts Person.compatibility(o, ab)
  ```

  1. Personクラスを継承して、FighterクラスとWizardクラスを作成する。

  [7.6.2.rb](./section7/7.6.2.rb)

  ```ruby

  class Person
    attr_reader :strength
    attr_reader :cleverness

    def initialize(st, cl)
      @strength = st
      @cleverness = cl
    end
  end

  class Fighter < Person
    alias base_strength strength

    def strength
      @strength * 1.5
    end
  end

  class Wizard < Person
    alias base_strength strength
    alias base_cleverness cleverness

    def strength
      @strength * 0.5
    end

    def cleverness
      @cleverness * 3
    end
  end

  f = Fighter.new(10, 10)
  puts f.strength
  puts f.base_strength
  #
  w = Wizard.new(10, 10)
  puts w.cleverness
  puts w.base_cleverness

  ```

7章の理解度チェック

  1. Mix-inに必要なモジュールが持つ性質3つ

    1. モジュールのインスタンスは作れない

    1. モジュールは継承のスーパークラスにはなれない

    1. モジュールは別のクラスまたはモジュールにインクルードできる

  1. 次のコードのように関連付けられるクラスMoney, Yenがある。Yenのオブジェクトのメソッドを呼び出すとき、クラス、モジュールを検索される順に並び替える

    ```ruby
    class Money
      # 省略
    end
    class Yen < Money
      include Comparable
      # 省略
    end
    ```

    呼ばれる順番

    d: Yen（自身のクラスが先に呼ばれる
    a: Comparable
    b: Money
    c: Object
    e: Kernel

  1. トップレベルで定義したメソッドが、どこからでも呼び出し可能な理由

    * トップレベルメソッド

    クラスやモジュール定義の外側で定義したメソッド

    Objectクラス内の領域で定義されるので、Objectクラスのメソッドとなり、全てのクラスはObjectクラスのサブクラスであるため、全てのクラスのどこからでも参照できる

  1. 次のMoneyクラスには通貨の比較を行うeql?メソッドが定義されている。このメソッドをサブクラスのYenでは通貨と金額を比較するメソッドに置き換えたい。ただし、元の通貨の比較はeql_currency?として残しておく。

  [7_check.4.rb](./section7/7_check.4.rb)

  ```ruby
  class Money
    attr_reader :currency
    def initialize(c)
      @currency = c
    end
    def eql?(other)
      other.class == self.class && other.currency == currency
    end
  end

  class Yen < Money
    attr_reader :value
    alias eql_currency? eql?
    def initialize(v)
      super('YEN')
      @value = v
    end

    def eql?(other)
      eql_currency?(other) && other.value == value
    end
  end

  ten1 = Yen.new(10)
  ten2 = Yen.new(10)
  hund = Yen.new(100)

  p ten1.eql?(ten1)
  p ten1.eql?(ten2)
  p ten1.eql?(hund)
  p ten1.eql_currency?(hund)
  ```

8.1

  1. 1〜10の整数がランダムに並んだ配列から、3の倍数を抽出して昇順に並べる

  [8.1.1.rb](./section8/8.1.1.rb)

  ```ruby
  list = [7, 6, 9, 4, 2, 10, 3, 1, 5, 8]

  p list.select { |value| value % 3 == 0 }.sort

  ```

  * collectとselectの違い

  ```ruby
  list = [7, 6, 9, 4, 2, 10, 3, 1, 5, 8]
  p list.select { |value| value % 3 == 0 } # => [6, 9, 3]

  p list.collect { |value| value if value % 3 == 0 } # => [nil, 6, 9, nil, nil, nil, 3, nil, nil, nil]
  ```

  collectは元の配列の要素数と同じだけ返り値がある

  selectは条件に合致した要素だけ返す

  1. じゃんけんのそれぞれの手を'G'(=グー)、'C'(=チョキ)、'P'(=パー)で表現する。G, C, Pを格納した配列から、それぞれの手に勝つ手を格納した配列を作成する

  [8.1.2.rb](./section8/8.1.2.rb)

  ```ruby
  janken = ['G', 'C', 'P']
  janken_win = []

  janken.each do |j|
    case j
    when j = 'G'
      janken_win << 'P'
    when j = 'C'
      janken_win << 'G'
    when j = 'P'
      janken_win << 'C'
    end
  end

  p janken_win

  ```

8.2

  1. この節で作成したMyArrayのeach1もしくはeach2メソッドを使って、selectメソッドを実装。

    [8.2.1.rb](./section8/8.2.1.rb)

    ```ruby
    class MyArray
      def initialize(ary)
        @ary = ary
      end
      def each1
        i = 0
        while i < @ary.size
          yield(@ary[i])
          i += 1
        end
      end
      def select1
        result = []
        each1 do |j|
          result << j if yield(j)
        end
        p result
      end

      def each2(&block)
        i = 0
        while i < @ary.size
          block.call(@ary[i])
          i += 1
        end
      end

      def select2(&block)
        result = []
        each2 do |j|
          result << j if block.call(j)
        end
        p result
      end
    end

    list = MyArray.new([7, 6, 9, 4, 2, 10, 3, 1, 5, 8])
    list.select1 { |i| i % 3 == 0 }
    list.select2 { |i| i % 3 == 0 }

    ```

    1. 1〜12の整数が格納された配列を付きの名前の配列に変換するメソッドを作成。1〜12以外の数字はスキップ。月の英語名はDateクラスのMONTHNAMESで取得可能。

      [8.2.2.rb](./section8/8.2.2.rb)

      ```ruby
      require 'date'

      # メソッド定義
      def chg_month(list, &block)
        # ブロックがある場合
        if block
          result = []
          list.each do |m|
            next unless (1..12).include?(m)
            result << block.call(m) if block.call(m)
          end
          p result
        # ブロック省略時
        else
          # 月の英語名
          e_month = Date::MONTHNAMES
          result = []
          list.each do |m|
            next unless (1..12).include?(m)
            result << e_month[m] if e_month[m]
          end
          p result
        end
      end

      # # ブロック省略時は英語名に変換
      chg_month([0, 1, 2, 3, 13]) # => ['January', ....]
      #
      # # ブロック指定時は指定された処理で変換
      chg_month([0, 1, 2, 3, 13]) {|m| "#{m}月"}

      ```

8.3

  1. ページ数を指定して、ページをカウントするページカウンタを作成する

    [8.3.1.rb](./section8/8.3.1.rb)

    ```ruby
    def page_counter(pages)
      pc = 0
      lambda do # ブロックだから、もちろんdo~endも使える
        pc += 1 if pc < pages
        puts "#{pc} / #{pages}"
      end
    end

    pc1 = page_counter(5)
    pc2 = page_counter(2)

    # callしているので、組み込み関数を使う
    pc1.call
    pc1.call
    pc2.call
    pc2.call
    pc2.call
    pc1.call
    pc1.call
    pc1.call
    ```

8章の理解度チェック

  1. ブロック、イテレータ、クロージャについて説明

    ブロック

      {}もしくはdo〜endで書く。コードの塊をメソッドに渡すことができる。

    イテレータ

      繰り返しに関するメソッド

    クロージャ

      オブジェクト化された手続き（ブロック付きメソッドに渡されたブロック引数）
      手続きと、その手続から参照可能なローカル変数などの状態を閉じ込めたブロック


  1. ブロックを実行するメソッドを、ブロックの実行方法を変えて2種類作れ

    [8_check.2.rb](./section8/8_check.2.rb)

    ```ruby
    # yieldを使う場合
    def method1(i)
      yield(i)
    end

    # ブロック引数を使う場合
    def method2(i, &block)
      block.call(i)
    end

    method1(3) { |x| puts x * x }
    method2(3) { |x| puts x * x }
    ```

  1. 次に示すメソッドを、ブロック省略時には単に引数nを表示するように変更する

    [8_check.3.rb](./section8/8_check.3.rb)

    ```ruby
    def method2(n)
      if defined? yield
        yield(n)
      else
        puts n
      end
    end

    method2(3) { |x| puts x * x }
    method2(2)
    ```

  1. 手続きオブジェクトをメソッドにブロック渡しするにはどうすればいいか

    メソッド呼び出し時に、引数に&をつけた手続きオブジェクトを指定する

  1. 呼び出される度に新しい値を生成するプログラムをジェネレーターという。初項と公比を指定して、等比数列を生成するジェネレーターを、クロージャを使って作成

    [8_check.5.rb](./section8/8_check.5.rb)

    ```ruby
    # 何乗するかを保持する場合
    def make_gs_gen(ft, cr)
      ans = 0
      count = 0
      lambda do
        ans = ft * (cr ** count)
        count += 1
        ans
      end
    end

    # 今の解答を保持する場合
    # def make_gs_gen(ft, cr)
    #   ans = 0
    #   lambda do
    #     if ans != 0
    #       ans *= cr
    #     else
    #       ans = ft
    #     end
    #   end
    # end

    gen1 = make_gs_gen(1, 2) # 初項1, 公比2
    gen2 = make_gs_gen(10, 10) # 初項10, 公比10

    puts gen1.call
    puts gen1.call
    puts gen1.call
    puts gen2.call
    puts gen2.call
    puts gen2.call
    ```

9.1

  1. 例外処理にはどんなメリットがあるか

    通常の処理と、例外の処理を分けて書くことができる

  1. 定義されていないクラスを使おうとしたときに発生する例外は何か

    NameError

9.2

  1. begin-end間に記述する、例外補足時の処理を記述する節、例外が発生しなかった時の処理を記述する節、例外発生有無に関係なく実行される処理を記述する節をそれぞれなんというか

    例外補足時の処理を記述する節

      rescue

    例外が発生しなかった時の処理を記述する節

      else

    例外発生有無に関係なく実行される処理を記述する節

      ensure


  1. ファイルを開いて文字列を書き込み、ファイルを閉じる下記のようなプログラムがあります。このプログラムを、ファイルが読み取り専用のときはエラー発生のメッセージを表示するよう変更する

    [9.2.2.rb](./section9/9.2.2.rb)

    ```ruby
    filename = 'example.txt'
    begin
      f = File.open(filename, 'w')
    rescue
      puts 'エラーが発生しました'
    else
      puts 'ファイルを開きました'
      f.puts 'test'
    ensure
      f.close if f
      puts 'ファイルを閉じました'
    end

    ```

9.3

  1. raiseにエラーメッセージの文字列を指定した場合に発生する例外クラスは何か

    RuntimeError

  1. ログイン処理のサンプルプログラムがある。必要な例外クラスの定義を追加し、loginメソッドの処理を完成させる。ただし、loginメソッドの振る舞いは以下のとおり。

    * ユーザ名が'server_error'の場合はサーバエラーとする
    * ログインできるユーザはユーザテーブル(users)に含まれるユーザのみとする
    * ユーザテーブルは、ユーザ名をkey, passwordを値にするハッシュとする

    [9.3.2.rb](./section9/9.3.2.rb)

    ```ruby
    class LoginCertifyError < StandardError
    end

    class LoginUserUnknownError < StandardError
    end

    class LoginServerError < StandardError
    end

    def login(u, p)
      users = {
        'user1' => 'pass1',
        'user2' => 'pass2',
      }

      raise LoginServerError if u == 'server_error'
      raise LoginUserUnknownError unless users.key?(u)
      raise LoginCertifyError unless users[u] == p
    end

    user = 'user1'
    pass = 'pass1'

    begin
      login(user, pass)
      puts 'ログインに成功'
    rescue LoginCertifyError => ce
      puts 'passwordが違う'
    rescue LoginUserUnknownError => ue
      puts 'ユーザが見つからない'
    rescue LoginServerError => se
      puts 'サーバに接続できない'
    end
    ```

9章理解度チェック

  1. 次のメソッドはWebサーバのレスポンスからContent-Typeを取得する。このコードではWebサーバに接続できない場合に例外が発生する。例外が発生した場合にはそのメッセージを表示し、nilを返すようにする。

  [9_check.1.rb](./section9/9_check.1.rb)

  ```ruby
  require 'net/http'

  def get_content_type(host, path)
    begin
      Net::HTTP.start(host) do |http|
        response = http.head(path)
        puts response['content-type']
      end
    rescue SocketError => err
      # STDERR.puts err.message
      $stderr.puts err.message
    end
  end

  get_content_type 'www.tech-arts.co.jp', '/index.html'
  ```

  1. 次のPersonクラスでは年齢の設定、取得が可能。年齢に整数でない値、負の数が設定されようとした場合に例外を発生させる。

    [9_check.2.rb](./section9/9_check.2.rb)

    ```ruby
    class Person
      def age
        @age
      end

      def age=(age)
        raise ArgumentError, '整数ではありません' unless age.integer?
        # raise ArgumentError, '整数ではありません' unless age.is_a?(Integer)
        raise ArgumentError, '正の数ではありません' unless age >= 0
        @age = age
      end
    end

    person = Person.new
    person.age = 20.1
    puts person.age
    ```

10.1

  1. キーボードからの入力を表示して、また入力待ちに戻るプログラム。exitが入力されたら終了

    [10.1.1.rb](./section10/10.1.1.rb)

    ```ruby
    loop do
      print '>'
      a = gets
      break if a.chomp == 'exit'
      puts a
    end
    puts '終了'

    ```

10.2

  1. month.txtに月の英語名を出力する

    [10.2.1.rb](./section10/10.2.1.rb)

    ```ruby
    require 'date'

    # ファイル名はダブルクォーテーション
    File.open("month.txt", 'w') do |f|
      (1..12).each do |i|
        f.puts Date::MONTHNAMES[i]
      end
    end

    ```

  1. 作成したmonth.txtを読み込み、各行を行番号月で表示するプログラムを作成

    [10.2.2.rb](./section10/10.2.2.rb)

    ```ruby
    File.open("month.txt", 'r') do |f|
      lines = f.readlines
      (1..12).each do |m|
        puts "#{m} #{lines[m-1]}"
      end
    end

    ```

10.3

  1. キーボードからの入力を1行ずつファイルに出力し、入力が終わったらファイルを閉じて、書き込まれたバイト数を表示する。終了コマンドはexit

    [10.3.1.rb](./section10/10.3.1.rb)

    ```ruby
    File.open("out.txt", 'w') do |f|
      loop do
        print '>'
        a = gets
        break if a.chomp == 'exit'
        f.puts a
      end
    end
    puts "#{File.size("out.txt")} byte 書き込みました"

    ```

  1. キーボードから入力されたファイル名の有無をチェックし、ファイルが存在すれば削除、存在しなければ警告を表示

    [10.3.2.rb](./section10/10.3.2.rb)

    ```ruby
    print 'file> '
    filename = gets
    filename.chomp!
    if File.exist?(filename)
      File.delete(filename)
      puts "#{filename} を削除しました"
    else
      puts "#{filename} が存在しません"
    end

    ```

10.4

  1. キーボードから入力されたディレクトリ名の有無をチェック、なければ作成、既にあれば警告を表示

    [10.4.1.rb](./section10/10.4.1.rb)

    ```ruby
    print 'directory> '
    dirname = gets
    dirname.chomp!
    if Dir.exist?(dirname)
      puts "#{dirname} は既に存在します"
    else
      Dir.mkdir(dirname)
      puts "#{dirname} を作成しました"
    end

    ```

  1. カレントディレクトリから下にあるファイル、ディレクトリをツリー表示する

    [10.4.2.rb](./section10/10.4.2.rb)

    ```ruby
    def dir_list(indent, wd)
      Dir.glob("#{wd}/**").each { |f|
        basename = File.basename(f)
        prefix = ''
        indent.times {prefix += '|  '}
        prefix += '+- '
        unless File.directory?(f)
          puts "#{prefix}#{basename}"
        else
          puts "#{prefix}#{basename}/"
          dir_list(indent + 1, f)
        end
      }
    end

    dir_list(0, '.')

    ```

10.5

  1. キーボードからコマンド入力を受け付けて処理を行うプログラム（touch, move, copy, remove, exit)

    [10.5.1.rb](./section10/10.5.1.rb)

    ```ruby
    require 'fileutils'

    loop do
      print '> '
      line = gets
      line.chomp!
      cmd = line.split(' ')

      case cmd[0]
      when 'exit'
        break
      when 'touch'
        File.open("#{cmd[1]}", 'w').close
        puts "#{cmd[1]} を作成しました"
      when 'move'
        FileUtils.mv(cmd[1], cmd[2])
        puts "#{cmd[1]} を #{cmd[2]} に変更しました"
      when 'copy'
        FileUtils.cp(cmd[1], cmd[2])
        puts "#{cmd[1]} を #{cmd[2]} にコピーしました"
      when 'remove'
        FileUtils.rm(cmd[1])
        puts "#{cmd[1]} を削除しました"
      else
        puts '該当しないコマンドです'
      end
    end

    ```

10章理解度チェック

  1. ファイルとディレクトリの操作に使用するクラス

    File, Dirクラス
    FileUtilsはモジュール

  1. キーボードから入力した整数値を受け取って10倍した値を出力する

    [10_check.2.rb](./section10/10_check.2.rb)

    ```ruby
    print '> '
    num = gets
    puts num.to_i * 10

    ```

  1. 任意の内容を含むテキストファイルexercise.txtがあるとする。このファイルの中身をすべて表示するプログラム

    ```ruby
    File.open("exercise.txt", 'r') { |f| puts f.read }
    ```

  1. ディレクトリを1つ選択して、そのディレクトリに存在するファイルの名称と拡張子を一覧表示するプログラム

    [10_check.4.rb](./section10/10_check.4.rb)

    ```ruby
    Dir.glob("./**").each do |file|
      next unless File.file?(file)
      puts "#{File.basename(file, '.*')}\t#{File.extname(file)}"
    end

    ```

  1. 上記で作成したテキストファイルexercise.txtを同じディレクトリ内にexercise_copy.txtという名前でコピーし、コピーしたファイルの中身を書き換える

    ```ruby
    require 'fileutils'

    FileUtils.cp('exercise.txt', 'exercise_copy.txt')
    File.open('exercise_copy.txt', 'w') { |f|
      f.puts '書き換える'
    }
    ```

11.1

  1. 人間にとってわかりやすいラベルとIPアドレスを対応付ける仕組み

    DNS Domain Name System

  1. 1台のサーバで複数のサービスを提供するとき、サービスごとに割り当てる識別子

    ポート

11.2

  1. pingは何をするコマンドか

    ネットワーク上にホストコンピュータが存在するか確認する

11.3

  1. ポート999番でソケット通信を待ち受けるサーバプログラム

    [11.3.1.rb](./section11/11.3.1.rb)

    ```ruby
    require 'socket'

    port_num = 999

    con = TCPServer.open(port_num)
    puts 'waiting connect'

    receive = con.accept

    receive.close
    con.close

    ```

  1. 上記のプログラムにデータを送信するクライアントプログラム

    [11.3.2.rb](./section11/11.3.2.rb)

    ```ruby
    require 'socket'

    port_num = 999
    host = 'localhost'

    con = TCPSocket.open(host, port_num)
    con.write('connect success')

    con.close

    ```

11.4

  1. localhostのIPアドレスを表示するプログラム

    ```ruby
    require 'socket'

    # joinするときに、型変換を指定しないと暗黙の変換(to_s)を行う
    puts Socket.gethostbyname('localhost')[3].unpack('CCCC').join('.')
    ```

11.5 googleの検索結果を取得するプログラム

  [11.5.1.rb](./section11/11.5.1.rb)

  ```ruby
  require 'net/http'

  def search(key)
    # 引数にはURIではなくFDQNを指定する
    # URI（httpから始まる）の場合は、parseする
    Net::HTTP.start('www.google.co.jp', 80) do |http|
      contents = http.post('/search', "q=#{key}")
      puts contents.body
    end
  end

  keyword = 'Ruby'
  search(keyword)

  ```

11.6

  メールサーバがないため、省略

11.7

  1. RubyのFTPサイトからファイルをダウンロードする

    ```ruby
    require 'net/ftp'

    # 接続情報
    server = 'ftp.ruby-lang.org/'
    port = 21
    user_id = 'anonymous'
    password = ''

    ftp = Net::FTP.new
    # FTPサーバに接続
    ftp.connect(server, port)
    # ログイン
    ftp.login(user_id, password)
    # ディレクトリの移動
    ftp.chdir('/pub/ruby')
    # ファイルの取得
    ftp.get('ruby-1.9.1-p243.tar.bz2')
    # セッションからログアウト
    ftp.quit

    ```

11章理解度チェック

  1. プロトコルとは何か

    通信を行う際の規約

  1. 以下のプロトコルのそれぞれの役割を説明

    * HTTP

      Hyper Text Transfer Protocol
      WWWにおけるHTMLや画像データなどの通信

    * SMTP

      Simple Mail Transfer Protocol
      メールサーバ間のメール転送

    * POP

      Post Office Protocol
      メールサーバに蓄えられたメールの受信

    * FTP

      File Transfer Protocol
      インターネットでのファイル転送

  1. 対話的に処理を行うFTPコマンド

    [11_check.3.rb](./11_check.3.rb)

    ```ruby
    require 'fileutils'

    loop do
      print '> '
      line = gets
      line.chomp!
      cmd = line.split(' ')

      case cmd[0]
      when 'exit'
        break
      when 'touch'
        File.open("#{cmd[1]}", 'w').close
        puts "#{cmd[1]} を作成しました"
      when 'move'
        FileUtils.mv(cmd[1], cmd[2])
        puts "#{cmd[1]} を #{cmd[2]} に変更しました"
      when 'copy'
        FileUtils.cp(cmd[1], cmd[2])
        puts "#{cmd[1]} を #{cmd[2]} にコピーしました"
      when 'remove'
        FileUtils.rm(cmd[1])
        puts "#{cmd[1]} を削除しました"
      else
        puts '該当しないコマンドです'
      end
    end

    ```

12.1

  1. プログラムの制御の流れには、メモリ空間をそれぞれ別に持つものと、共有するものがあるが、それぞれなんというか

    メモリ空間を別に持つ　プロセス
    メモリ空間を共有する　スレッド

  
