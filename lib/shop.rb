require('item')
require('items/aged_brie')
require('items/backstage_pass')
require('items/generic_item')
require('items/conjured_mana_cake')

class Shop
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      return if item.name == 'Sulfuras, Hand of Ragnaros'

      update_item_quality(item)
      update_item_sell_in(item) 
    end
  end

  private

  def update_item_quality(item)
    if item.name == 'Aged Brie'
      AgedBrie.new(item).update
    elsif item.name == 'Backstage passes to a TAFKAL80ETC concert'
      BackstagePass.new(item).update
    elsif item.name == 'Conjured Mana Cake'
      ConjuredManaCake.new(item).update
    else
      GenericItem.new(item).update
    end
  end

  def update_item_sell_in(item)
    item.sell_in -= 1 
  end
end
