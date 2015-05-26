# ワイルドカードはデフォルトではファイル名の先頭の "." にマッチしない
# File::FNM_DOTMATCHフラグを第二引数に指定すればマッチする
puts files_and_directories = Dir.glob('*')

files = []

pattern = /\d+.*\.(txt|html|css|md)$/

files_and_directories.each { |f| files.push(f) if File.directory?(f) == false }

files.each { |file| puts file if pattern =~ file }
