require 'date'

# メソッド定義
def chg_month(list, &block)
  # ブロックがある場合
  if block
    result = []
    list.each do |m|
      next unless (1..12).include?(m)
      result << block.call(m) if block.call(m)
    end
    p result
  # ブロック省略時
  else
    # 月の英語名
    e_month = Date::MONTHNAMES
    result = []
    list.each do |m|
      next unless (1..12).include?(m)
      result << e_month[m] if e_month[m]
    end
    p result
  end
end

# # ブロック省略時は英語名に変換
chg_month([0, 1, 2, 3, 13]) # => ['January', ....]
#
# # ブロック指定時は指定された処理で変換
chg_month([0, 1, 2, 3, 13]) {|m| "#{m}月"}
