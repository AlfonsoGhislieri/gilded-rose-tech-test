require_relative('item')

class GildedRose
  MAX_QUALITY = 50
  MIN_QUALITY = 0
  def initialize(items)
    @items = items
  end

  def update_quality
    
    @items.each do |item|
      # check for not a special item
      return if item.name == 'Sulfuras, Hand of Ragnaros'

      if item.name == 'Aged Brie'
        increase_quality(item)
        increase_quality(item) if expired?(item)
      elsif item.name == 'Backstage passes to a TAFKAL80ETC concert'
        increase_quality(item)
        increase_quality(item) if item.sell_in < 11
        increase_quality(item) if item.sell_in < 6 
        item.quality = 0 if expired?(item)
      else
        decrease_quality(item)
        decrease_quality(item) if expired?(item)
      end
      update_sell_in(item) 
    end
  end

  private

  def decrease_quality(item)
    item.quality -= 1 if item.quality > MIN_QUALITY
  end

  def increase_quality(item)
    item.quality += 1 if item.quality < MAX_QUALITY
  end

  def update_sell_in(item)
    item.sell_in -= 1 
  end

  def expired?(item)
    item.sell_in <= 0
  end
end
