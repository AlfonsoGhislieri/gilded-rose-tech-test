require_relative('item.rb')

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
    if item.quality < 50 && item.quality > 0
      #check for everything thats not Aged brie, pass or sulfuras --> lowers quality
      if item.name != "Aged Brie" && item.name != "Backstage passes to a TAFKAL80ETC concert" && item.name != "Sulfuras, Hand of Ragnaros"
        if item.sell_in <= 0 && item.quality > 0
          item.quality = item.quality - 2
        else
          item.quality = item.quality - 1
        end

        # raises value of brie 
      elsif item.name == "Aged Brie"
        if item.sell_in <= 0
          item.quality += 2
        else
          item.quality += 1
        end

        # update quality of backstage pass
      elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
        if item.sell_in <= 0 && item.quality > 0
          update_sell_in(item)
          return item.quality = item.quality - item.quality
        end
        item.quality = item.quality + 1
 
        if item.sell_in < 11
          item.quality = item.quality + 1 if item.quality < 50
        end
        if item.sell_in < 6
          item.quality = item.quality + 1 if item.quality < 50
        end
      end

      # decreases sell_in for all but Sulfuras 
      update_sell_in(item)
    end
  end
  end

  private 

  def update_sell_in(item)
    item.sell_in -= 1 unless item.name == "Sulfuras, Hand of Ragnaros"
  end
end
