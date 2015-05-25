def greeting(str='Hello', name=nil)
  if name.nil?
    puts "#{str}."
  else
    puts "#{str}, #{name}."
  end
end

greeting
greeting('thanks')
greeting('Test', 'negi')
