# frozen_string_literal: true

require_relative('./item')
require_relative('./items/aged_brie')
require_relative('./items/backstage_pass')
require_relative('./items/generic_item')
require_relative('./items/conjured_mana_cake')

class Shop
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      next if item.name == 'Sulfuras, Hand of Ragnaros'

      update_item_quality(item)
      update_item_sell_in(item)
    end
  end

  private

  def update_item_quality(item)
    case item.name
    when 'Aged Brie'
      AgedBrie.new(item).update
    when 'Backstage passes to a TAFKAL80ETC concert'
      BackstagePass.new(item).update
    when 'Conjured Mana Cake'
      ConjuredManaCake.new(item).update
    else
      GenericItem.new(item).update
    end
  end

  def update_item_sell_in(item)
    item.sell_in -= 1
  end
end
