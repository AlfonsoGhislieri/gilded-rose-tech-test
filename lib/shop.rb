require('item')
require('aged_brie')
require('backstage_pass')
require('generic_item')

class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      # check for not a special item
      return if item.name == 'Sulfuras, Hand of Ragnaros'

      if item.name == 'Aged Brie'
        AgedBrie.new(item).update
      elsif item.name == 'Backstage passes to a TAFKAL80ETC concert'
        BackstagePass.new(item).update
      else
        GenericItem.new(item).update
      end
      update_sell_in(item) 
    end
  end

  private

  def update_sell_in(item)
    item.sell_in -= 1 
  end
end
