require 'socket'

port_num = 999
host = 'localhost'

con = TCPSocket.open(host, port_num)
con.write('connect success')

con.close
