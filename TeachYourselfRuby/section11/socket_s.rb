require 'socket'

port_num = 12345

con = TCPServer.open(port_num)
puts 'waiting connect'

receive = con.accept

while data = receive.gets
  puts data
end
