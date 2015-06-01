require 'socket'

port_num = 999

con = TCPServer.open(port_num)
puts 'waiting connect'

receive = con.accept

receive.close
con.close
