# frozen_string_literal: true

module Helper
  MAX_QUALITY = 50
  MIN_QUALITY = 0

  def expired?(item)
    item.sell_in <= 0
  end

  def increase_quality(item)
    item.quality += 1 if item.quality < MAX_QUALITY
  end

  def decrease_quality(item)
    item.quality -= 1 if item.quality > MIN_QUALITY
  end
end
