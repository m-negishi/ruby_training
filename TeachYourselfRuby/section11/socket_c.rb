require 'socket'

host = 'localhost'
port_num = 12345

con = TCPSocket.open(host, port_num)
con.write('connect success')

con.close
