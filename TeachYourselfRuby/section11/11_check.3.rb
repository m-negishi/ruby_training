require 'net/ftp'

ftp = Net::FTP.new

loop do
  print '> '
  line = gets
  cmd = line.chomp.split
  # splitはデフォルトで空白で分割する
  # cmd = line.split(' ')

  case cmd[0]

  when 'open'
    # 接続情報
    server = cmd[1]
    port = 21
    # ユーザ名、パスワードが未入力の場合を考慮
    user_id = cmd[2] || 'anonymous'
    password = cmd[3] || ''

    ftp.connect(server, port)
    ftp.login(user_id, password)

    puts "#{cmd[1]}に接続しました"
  when 'cd'
    ftp.chdir(cmd[1])
    puts "#{cmd[1]}にいます"
  when 'dir'
    puts ftp.dir
  when 'get'
    puts 'ダウンロード開始'
    ftp.get(cmd[1])
    puts 'ダウンロード完了'
  when 'bye'
    puts '終了します'
    ftp.quit
    break
  end
end
