dirArray = Dir.glob("./*")

dirArray.each do |dir|
  if /\d*\.txt|\d*\.html|\d*\.css|\d*\.md/ =~ dir
    p dir
  end
end
