require_relative('item.rb')

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
    #check for everything thats not Aged brie, pass or sulfuras --> lowers quality
    if item.name != "Aged Brie" && item.name != "Backstage passes to a TAFKAL80ETC concert"
      if item.quality > 0
        if item.name != "Sulfuras, Hand of Ragnaros"
          item.quality = item.quality - 1
        end
      end
      else
        # check for backstage pass and increase value depending on sell_in date
        if item.quality < 50
          # raises value of brie and backstage
          item.quality = item.quality + 1
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if item.sell_in < 11
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
            if item.sell_in < 6
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
          end
        end
      end

      # decreases sell_in for all but Sulfuras 
      item.sell_in -= 1 unless item.name == "Sulfuras, Hand of Ragnaros"

      # sell in below 0
      if item.sell_in < 0 && item.quality > 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
              if item.name != "Sulfuras, Hand of Ragnaros"
                # lowers item quality of items
                item.quality = item.quality - 1
              end
            # backstage pass quality becomes 0 after sell_in date reaches 0
          else
            item.quality = item.quality - item.quality
          end
        else
          # relowers brie
          if item.quality < 50
            item.quality = item.quality + 1
          end
        end
      end

    end
  end
end
