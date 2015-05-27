class Chef
  private

  def precooking
    puts '下ごしらえ'
  end

  def cooking
    precooking
    puts '調理'
    seasoning
    setout
  end

  # ここに追加
  public :cooking

  def seasoning
    puts '味付け'
  end

  def setout
    puts '盛り付け'
  end
end
