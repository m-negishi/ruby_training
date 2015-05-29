def page_counter(pages)
  pc = 0
  lambda do
    pc += 1 if pc < pages
    puts "#{pc} / #{pages}"
  end
end

pc1 = page_counter(5)
pc2 = page_counter(2)

# callしているので、組み込み関数を使う
pc1.call
pc1.call
pc2.call
pc2.call
pc2.call
pc1.call
pc1.call
pc1.call
