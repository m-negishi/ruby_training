require 'net/http'

def get_content_type(host, path)
  begin
    Net::HTTP.start(host) do |http|
      response = http.head(path)
      puts response['content-type']
    end
  rescue SocketError => err
    # STDERR.puts err.message
    $stderr.puts err.message
  end
end

get_content_type 'www.tech-arts.co.jp', '/index.html'
