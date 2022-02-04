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
      if valid_item_quality?(item)
        # check for not a special item
        if not_special_item?(item)
          item.quality -= expired?(item) && valid_item_quality?(item) ? 2 : 1

        elsif item.name == 'Aged Brie'
          item.quality += expired?(item) ? 2 : 1

        # update quality of backstage pass
        elsif item.name == 'Backstage passes to a TAFKAL80ETC concert'
          if expired?(item) && item.quality > MIN_QUALITY
            update_sell_in(item)
            return item.quality = 0
          end
          item.quality = item.quality + 1

          item.quality = item.quality + 1 if item.sell_in < 11 && (item.quality < MAX_QUALITY)
          item.quality = item.quality + 1 if item.sell_in < 6 && (item.quality < MAX_QUALITY)
        end
      end
      # decreases sell_in for all but Sulfuras
      update_sell_in(item)
    end
  end

  private

  def update_sell_in(item)
    item.sell_in -= 1 unless item.name == 'Sulfuras, Hand of Ragnaros'
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
