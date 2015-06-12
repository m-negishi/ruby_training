require 'socket'

# host = "www.choeisha.co.jp"
# port = 80
host = "localhost"
port = 2000
path = "/"

# puts "接続開始"
# Webサイトに接続
sock = TCPSocket.open(host, port)
# HTTPリクエスト文字列の生成
request =<<EOF
GET #{path} HTTP/1.0\r
Host: #{host}\r
\r
EOF
# puts "送信"
# HTTPリクエスト送信
sock.puts(request)

response = ""
length = 0

# puts "レス待ち"
# レスポンスを1行ずつ読み込む
while buf = sock.gets
  # 1行ずつ読みだしたレスポンスを1つの文字列に連結していく
  response << buf
  # レスポンスに空行があればヘッダ部終了
  if response =~ /\r\n\r\n/
    # Content-Lengthヘッダからボディ部の長さを取得
    # ()でくくっているので、キャプチャ`$`で取得できる
    if response =~ /content-length: (\d+)/i
      length = $1.to_i
    end
    break
  end
end

body = ""
# ソケットから残りのレスポンスをボディ長分だけ読み込む
while buf = sock.gets
  body << buf
  break if body.size >= length
end
# puts "出力"
# ボディ部を出力
puts body

# 通信が終わったらソケットを閉じる
sock.close
