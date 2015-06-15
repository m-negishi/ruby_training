require 'socket'

port = 2000

# 改行コードを定数化
CR = "\r"
LF = "\n"
CRLF = "#{CR}#{LF}"

# サーバ側の待受ソケットを生成
server = TCPServer.open(port)

# HTTPリクエストのヘッダ解析
def parse_request(sock)
  # リクエストの先頭行を読み込み（Request line）
  request_line = ""
  while request_line !~ /#{CRLF}|#{LF}/
    request_line += sock.read(1)
  end

  # Request Lineを解析
  if /^(\w+)\s+([^\s]+)\s+HTTP\/(\d)\.(\d)/ =~ request_line
    request_method = $1
    request_uri = $2
    ver_major = $3
    ver_minor = $4
  end

  # Request methodがない場合はエラー
  raise "Request line parse error" unless request_method

  case request_method
  when /GET/
    ENV['REQUEST_METHOD'] = 'GET'
  else
    raise "Unknown request method"
  end

  # ヘッダ部の読み込み
  head = ""
  while head !~ /#{CRLF}#{CRLF}|#{LF}#{LF}/
    head += sock.read(1)
  end

  request_uri
end

# HTTPレスポンスの作成
def make_response(code, phrase, content)
  response =<<EOF
HTTP/1.0 #{code} #{phrase}#{CR}
Content-Type: text/html#{CR}
Content-Length: #{content.length.to_s}#{CR}
#{CR}
#{content}
EOF
  response
end

# リクエストの受信処理
def recv_request(conn)
  if conn.eof?
    # コネクションの終了の場合
    conn.close
    puts "connection closed #{conn}"
    return
  end
  response = nil
  begin
    # リクエストを受信
    request_uri = parse_request(conn)
    # レスポンスのボディ部
    body =<<-EOF
<html><body>Hello World</body></html>
    EOF
    response = make_response(200, "OK", body)
  rescue => e
    # エラーレスポンス返信
    response = make_response(500, "Internal Server Error", "Server Error")
  ensure
    conn.write(response) if response
    conn.close
  end
end

# リクエストの待受ループ
loop do
  s = server.accept
  puts "accepted #{s}"
  # スレッドに受信処理を任せる
  Thread.start do
    # スレッド内の変数にコピー(スレッド内のローカル変数にすることで、他のスレッドから参照されないようにする)
    conn = s
    recv_request(conn)
    puts "connection thread done #{conn}"
  end
end
