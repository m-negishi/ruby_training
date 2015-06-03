# require 'socket'
require 'net/http'

def search(key)
  # 引数にはURIではなくFDQNを指定する
  # URI（httpから始まる）の場合は、parseする
  Net::HTTP.start('www.google.co.jp', 80) do |http|
    contents = http.post('/search', "q=#{key}")
    puts contents.body
  end
end

keyword = 'Ruby'
search(keyword)
