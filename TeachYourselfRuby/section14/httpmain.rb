require './minihttp/server'

http = MiniHTTP::Server.new({
  Port: 2000,
  DocumentRoot: '.'
})
http.start
