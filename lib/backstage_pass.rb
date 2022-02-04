class BackstagePass
  def initialize(item)
    @item = item
  end

  def update
    @item.quality += 1 if @item.quality < 50
    @item.quality += 1 if @item.sell_in < 11 && @item.quality < 50
    @item.quality += 1 if @item.sell_in < 6 && @item.quality < 50

    @item.quality = 0 if @item.sell_in == 0
  end
end