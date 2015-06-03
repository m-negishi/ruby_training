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
