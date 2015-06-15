require 'socket'
require './minihttp/base'
require './minihttp/request'
require './minihttp/response'
require './minihttp/status'

module MiniHTTP

class Process
  def initialize(socket)
    # クライアント接続ソケットを渡してオブジェクトを生成する
    @socket = socket
  end

  # 処理の実行
  def run
    # リクエストの受信からレスポンスの返信までを管理する
    # クライアント接続ごとの処理を実施する
    puts "process for #{@socket}"
    if @socket.eof?
      @socket.close
      puts "connection closed #{@socket}"
      return
    end

    req = Request.new
    res = Response.new

    begin
      # リクエストを解析
      req.parse(@socket)
      # レスポンスにリクエストのHTTPバージョンを設定
      res.set_version(req.major_ver, req.minor_ver)
      # HTTPバージョン
      service(req, res)
    rescue Error => e
      # レスポンスにエラーを設定
      puts e.inspect
      res.set_error(e.code, e.reason)
    rescue => e
      # レスポンスにエラーを設定
      puts e.inspect
      res.set_error(500, "Internal Server Error")
    ensure
      res.send(@socket) if res
      @socket.close
    end
  end

  # HTTPのサービス(サーバ処理の本体)
  def service(req, res)
    puts "service for req=#{req}, res=#{res}"
    case req.request_method
    when /GET/
      ENV['REQUEST_METHOD'] = 'GET'
    else
      # GET以外は未実装のエラー
      raise ServerError.new(501, "Not Implemented")
    end

    # Request-URIからファイルを検索
    path = req.request_uri
    path.gsub!(/\.\.+/, "")# 相対標記の(..)を削除(上位のディレクトリに参照できないようにする)
    path = "/#{path}" unless /^\// =~ path
    path = ".#{path}"# カレントディレクトリにするために(./)を追加
    path << "index.html" if /\/$/ =~ path# pathの末尾がディレクトリの場合、index.htmlを参照するようにする

    # ファイルが存在しない場合はエラー
    raise ClientError.new(404, "Not Found") unless File.exist?(path)
    # ファイルが読み込み不可の場合はエラー
    raise ClientError.new(403, "Forbidden") unless File.readable?(path)
    # HTMLでない場合は、テキストファイル扱い
    res.content_type = 'text/plain' unless File.extname(path) != '.html'

    # ファイルの内容をボディ部として読み込む
    File.open(path) do |file|
      res.body = file.read
    end
    # レスポンスに正常終了ステータスを設定
    res.set_status("200", "OK")
  end
end

# HTTPサーバを表すクラス
class Server
  def initialize(port)
    @socket = nil
    @port = port
  end

  # HTTPの待ち受け処理を開始する
  def start
    # サーバの待ち受け処理を開始する
    @socket = TCPServer.open(@port)

    # リクエストの待受ループ
    loop do
      sock = @socket.accept
      puts "accepted #{sock}"

      # スレッドに受信処理を任せる
      Thread.start do
        # クライアントソケットに対するプロセス
        process = Process.new(sock)
        process.run
        puts "connection thread done #{sock}"
      end
    end
  end
end

end
