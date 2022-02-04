require('item')

class GildedRose
  MAX_QUALITY = 50
  MIN_QUALITY = 0
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      modifier = 0
      # check for not a special item
      return if item.name == 'Sulfuras, Hand of Ragnaros'

      if item.name == 'Aged Brie'
        modifier = aged_brie_modifier(item)
      elsif item.name == 'Backstage passes to a TAFKAL80ETC concert'
        increase_quality(item)
        increase_quality(item) if item.sell_in < 11
        increase_quality(item) if item.sell_in < 6 
        item.quality = 0 if expired?(item)
      else
        decrease_quality(item)
        decrease_quality(item) if expired?(item)
      end
      item.quality += modifier
      update_sell_in(item) 
    end
  end

  private

  def aged_brie_modifier(item)
    result = 0
    result += 1 if item.quality < MAX_QUALITY
    result += 1 if expired?(item) && item.quality < MAX_QUALITY
    return result
  end

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
