module MiniHTTP

class Error < StandardError
  # エラーのステータスコードと理由表示を参照する
  attr_reader :code, :reason

  def initialize(code, reason)
    # ステータスコードと理由表示を指定してオブジェクトを生成する
    @code = code
    @reason = reason
  end
end

# クライアントエラーを表すクラス
class ClientError < Error; end
# サーバエラーを表すクラス
class ServerError < Error; end

end
