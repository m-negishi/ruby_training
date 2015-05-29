class LoginCertifyError < StandardError
end

class LoginUserUnknownError < StandardError
end

class LoginServerError < StandardError
end

def login(u, p)
  users = {
    'user1' => 'pass1',
    'user2' => 'pass2',
  }

  raise LoginServerError if u == 'server_error'
  raise LoginUserUnknownError unless users.key?(u)
  raise LoginCertifyError unless users[u] == p
end

user = 'user1'
pass = 'pass1'

begin
  login(user, pass)
  puts 'ログインに成功'
rescue LoginCertifyError => ce
  puts 'passwordが違う'
rescue LoginUserUnknownError => ue
  puts 'ユーザが見つからない'
rescue LoginServerError => se
  puts 'サーバに接続できない'
end
