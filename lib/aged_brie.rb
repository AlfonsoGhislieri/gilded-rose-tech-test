class AgedBrie
  def initialize(item)
    @item = item
  end

  def update
    @item.quality += 1 if @item.quality < 50
    @item.quality += 1 if @item.quality < 50 && @item.sell_in <= 0
  end
end