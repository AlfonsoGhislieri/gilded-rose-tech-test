require_relative('item.rb')

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
    #check for everything thats not Aged brie, pass or sulfuras --> lowers quality
    if item.name != "Aged Brie" && item.name != "Backstage passes to a TAFKAL80ETC concert"
      # if its not sulfuras --> lower it
      if item.quality > 0 && item.name != "Sulfuras, Hand of Ragnaros"
        item.quality = item.quality - 1
      end

    else
      if item.quality < 50
        # raises value of brie and backstage
        item.quality = item.quality + 1

        if item.name == "Backstage passes to a TAFKAL80ETC concert"
          if item.sell_in < 11
            item.quality = item.quality + 1 if item.quality < 50
          end

          if item.sell_in < 6
            item.quality = item.quality + 1 if item.quality < 50
          end
        end
      end
    end
    update_sell_in(item)
  end
  end

  private 

  def update_sell_in(item)
    # decreases sell_in for all but Sulfuras 
    item.sell_in -= 1 unless item.name == "Sulfuras, Hand of Ragnaros"

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
