# frozen_string_literal: true

require_relative('../helper_module.rb')

class ConjuredManaCake
  include Helper
  def initialize(item)
    @item = item
  end

  def update
    if expired?(@item)
      4.times { decrease_quality(@item) }
    else
      2.times { decrease_quality(@item) }
    end
  end
end
