require 'socket'

port = 2000
# サーバ側の待受ソケットを生成
server = TCPServer.open(port)
# 待受のソケットのリスト
socks = [server]

while true
  # puts "while"
  # 待ち受けのリストから、リクエストがきたソケットを検出
  ns = select(socks)
  # puts "ns get"
  next if ns == nil
  for s in ns[0] # ns[0]に読み込みできるソケットリストが入る
    if s == server
      # puts "server"
      # サーバソケットの場合は新しい接続要求
      conn = s.accept
      # 待ち受けリストに追加
      socks << conn
      puts "accepted #{conn}"
      puts "waiting #{socks}"
    else
      if s.eof?
        # puts "終了"
        # コネクション終了の場合
        s.close
        # 待ち受けリストから除外
        socks.delete(s)
        puts "connection done #{s}"
      else
        # puts "not EOF"
        # HTTPリクエストを受信
        request = ""
        while buf = s.gets
          request << buf
          # リクエストの終わりまで受信
          next unless request =~ /\r\n\r\n/
          # レスポンスのボディ部
          body =<<EOF
<html><body>Hello World</body></html>
EOF
          response =<<EOF
HTTP/1.0 200 OK\r
Content-Type: text/html\r
Content-Length: #{body.size}\r
\r
#{body}
EOF
          s.write(response)
          # puts "書き込み"
          break
        end
      end
    end
  end
end
