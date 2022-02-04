require_relative('item')

class GildedRose
  MAX_QUALITY = 50
  MIN_QUALITY = 0
  def initialize(items)
    @items = items
    @special_items = ['Aged Brie', 'Backstage passes to a TAFKAL80ETC concert', 'Sulfuras, Hand of Ragnaros']
  end

  def update_quality
    
    @items.each do |item|
      # check for not a special item
      if not_special_item?(item)
        decrease_value(item)
        decrease_value(item) if expired?(item)

      elsif item.name == 'Aged Brie'
        increase_value(item)
        increase_value(item) if expired?(item)

      # update quality of backstage pass
      elsif item.name == 'Backstage passes to a TAFKAL80ETC concert'
        if expired?(item) && valid_item_quality?(item)
          update_sell_in(item)
          return item.quality = 0
        end
        if item.sell_in < 11 && (item.quality < MAX_QUALITY)
          item.quality += 1
          if item.sell_in < 6 && (item.quality < MAX_QUALITY)
            item.quality += 1
          end
        end

        item.quality +=1
      end
      # decreases sell_in for all but Sulfuras
      update_sell_in(item) unless item.name == 'Sulfuras, Hand of Ragnaros'
    end
  end

  private

  def decrease_value(item)
    item.quality -= 1 if item.quality > MIN_QUALITY
  end

  def increase_value(item)
    item.quality += 1 if item.quality < MAX_QUALITY
  end

  def update_sell_in(item)
    item.sell_in -= 1 
  end

  def valid_item_quality?(item)
    item.quality < MAX_QUALITY && item.quality > MIN_QUALITY
  end

  def expired?(item)
    item.sell_in <= 0
  end

  def not_special_item?(item)
    @special_items.none?(item.name)
  end
end
