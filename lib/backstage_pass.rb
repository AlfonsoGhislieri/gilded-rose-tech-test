require('helper_module')

class BackstagePass
  include Helper
  def initialize(item)
    @item = item
  end

  def update
    increase_quality(@item)
    increase_quality(@item) if @item.sell_in < 11 
    increase_quality(@item) if @item.sell_in < 6

    @item.quality = 0 if expired?(@item)
  end
end