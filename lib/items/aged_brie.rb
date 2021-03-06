# frozen_string_literal: true

require_relative('../helper_module.rb')

class AgedBrie
  include Helper
  def initialize(item)
    @item = item
  end

  def update
    increase_quality(@item)
    increase_quality(@item) if expired?(@item)
  end
end
