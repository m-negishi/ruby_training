require './minihttp/base'
require './minihttp/status'

module MiniHTTP

class Request
  # リクエストの要素を参照する
  attr_reader :request_method, :request_uri
  attr_reader :major_ver, :minor_ver

  def initialize
    @request_line = nil
    @request_method = nil
    @request_uri = nil
    @major_ver = nil
    @minor_ver = nil
  end

  # リクエストを解析する
  def parse(socket)
    # リクエストを受信してメッセージをを解析する
    return unless socket
    puts "parse request for #{socket}"
    # リクエストの先頭行を読み込み
    @request_line = read_line(socket)
    # Request lineがない場合はエラー
    riase ClientError.new(400, "Bad Request") unless @request_line
    # Request lineを解析
    if /^(\w+)\s+([^\s]+)\s+HTTP\/(\d)\.(\d)/ =~ @request_line
      @request_method = $1
      @request_uri = $2
      @major_ver = $3
      @minor_ver = $4
    end
    # Request methodがない場合はエラー
    raise ClientError.new(400, "Bad Request") unless @request_method
    # ヘッダ部の終わりまで読み込み
    while line = read_line(socket)
      break if /^#{CRLF}|#{LF}$/ =~ line
    end
  end

private

  def read_line(socket)
    line = ""
    while line !~ /#{CRLF}|#{LF}/
      line += socket.read(1)
    end
    line
  end
end

end
