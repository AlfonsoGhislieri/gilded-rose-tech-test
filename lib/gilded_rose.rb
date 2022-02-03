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
        item.quality = item.quality - 1

        # raises value of brie 
      elsif item.name == "Aged Brie"
        item.quality = item.quality + 1

        # update quality of backstage pass
      elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
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

      # sell in below 0 and quality not bellow 0
      if item.sell_in < 0 && item.quality > 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert" && item.name != "Sulfuras, Hand of Ragnaros"
            item.quality = item.quality - 1
          else
            # backstage pass quality becomes 0 after sell_in date reaches 0
            item.quality = item.quality - item.quality
          end
        else
          # lowers brie again
          if item.quality < 50
            item.quality = item.quality + 1
          end
        end
      end

    end
  end
  end

  private 

  def update_sell_in(item)
    item.sell_in -= 1 unless item.name == "Sulfuras, Hand of Ragnaros"
  end
end
