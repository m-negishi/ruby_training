require 'fileutils'

loop do
  print '> '
  line = gets
  line.chomp!
  cmd = line.split(' ')

  case cmd[0]
  when 'exit'
    break
  when 'touch'
    File.open("#{cmd[1]}", 'w').close
    puts "#{cmd[1]} を作成しました"
  when 'move'
    FileUtils.mv(cmd[1], cmd[2])
    puts "#{cmd[1]} を #{cmd[2]} に変更しました"
  when 'copy'
    FileUtils.cp(cmd[1], cmd[2])
    puts "#{cmd[1]} を #{cmd[2]} にコピーしました"
  when 'remove'
    FileUtils.rm(cmd[1])
    puts "#{cmd[1]} を削除しました"
  else
    puts '該当しないコマンドです'
  end
end
