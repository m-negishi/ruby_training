require 'socket'
require 'thread'

port_num = 12345

con = TCPServer.open(port_num)
puts 'waiting connect'

count = 1

loop do
  Thread.start(con.accept) do |receive|
    data = receive.gets
    puts data + count.to_s
    count += 1
    receive.close
  end
end

con.close
