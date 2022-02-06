# frozen_string_literal: true

require_relative('../helper_module.rb')

class GenericItem
  include Helper
  def initialize(item)
    @item = item
  end

  def update
    decrease_quality(@item)
    decrease_quality(@item) if expired?(@item)
  end
end
