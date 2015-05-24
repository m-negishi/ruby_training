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

  [2.5.1.rb](./2.5.1.rb)
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

  [2.5.2.rb](./2.5.2.rb)
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

  [2.6.1.rb](./2.6.1.rb)
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

 [2_check.rb](./2_check.rb)

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

  [3.2.1.rb](./3.2.1.rb)
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

  [3_check.rb](./3_check.rb)

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

   [4.1.1.rb](./4.1.1.rb)
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

   [4.1.2.rb](./4.1.2.rb)
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

    [4.2.1.rb](./4.2.1.rb)
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

    [4.2.2.rb](./4.2.2.rb)
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

    [4.3.2.rb](./4.3.2.rb)
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

    [4.4.2.rb](./4.4.2.rb)
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

    [4_check.1.rb](./4_check.1.rb)
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

    [4_check.2.rb](./4_check.2.rb)
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

    [5.1.1.rb](./5.1.1.rb)
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

    [5.2.1.rb](./5.2.1.rb)
    ```ruby
    require 'date'

    day1 = Date.new(2008, 2, 3)
    day2 = Date.new(2008, 9, 10)
    diff_days = day2 - day1

    puts diff_days.to_i #to_sだと`220/1`となる
    ```

  1. 適切なコードを入れ、うるう年を判定して表示するプログラム

    [5.2.2.rb](./5.2.2.rb)
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

  [5_check.rb](./5_check.rb)

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

  [6.1.1.rb](./6.1.1.rb)

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

  [6.1.2.rb](./6.1.2.rb)

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
