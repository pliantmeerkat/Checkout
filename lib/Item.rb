# Item class
class Item
  attr_accessor :price

  def initialize(price = 0.00)
    @price = price.to_f
  end
end
