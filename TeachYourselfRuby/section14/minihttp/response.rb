require './minihttp/base'

module MiniHTTP

class Response
  # レスポンスの要素を参照する
  attr_accessor :content_type, :body

  def initialize
    @code = nil
    @reason = nil
    @major_ver = nil
    @minor_ver = nil
    @content_type = 'text/html'
    @body = ''
  end

  def set_status(code, reason)
    # レスポンスのステータスコードと理由表示を設定する
    @code = code
    @reason = reason
  end

  # レスポンスにHTTPバージョンを設定する
  def set_version(major, minor)
    @major_ver = major
    @minor_ver = minor
  end

  # ステータス行を返す
  def status_line
    "HTTP/ #{@major_ver}.#{@minor_ver} #{@code} #{@reason}"
  end

  def set_error(code, reason)
    # エラーレスポンスのステータスコードと理由表示を設定する
    set_status(code, reason)
    @body =<<-EOC
<html><body>
#{reason}
</body></html>
    EOC
  end

  def send(socket)
    # レスポンスのメッセージを送信する
    return unless socket
    send_header(socket)
    send_body(socket)
  end

private

  def send_header(socket)
    data = status_line + CRLF
    data << "Content-type: #{@content_type}" << CRLF
    data << "Content-Length: #{@body.size}" << CRLF
    data << CRLF
    socket.write(data)
  end

  def send_body(socket)
    socket.write(@body)
  end
end

end
