janken = ['G', 'C', 'P']
janken_win = []

janken.each do |j|
  case j
  when j = 'G'
    janken_win << 'P'
  when j = 'C'
    janken_win << 'G'
  when j = 'P'
    janken_win << 'C'
  end
end

p janken_win
