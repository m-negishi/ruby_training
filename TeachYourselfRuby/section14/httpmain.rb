require './minihttp/server'

http = MiniHTTP::Server.new(2000)
http.start
