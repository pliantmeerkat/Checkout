# Till class
class Till
  attr_accessor :items
  attr_accessor :total
  def initialize
    @items = [] # create an empty array of items
    @total = 0.00 # total is always zero
  end

  def scan(item)
    items.push(item) # add item to list
    @total += item.price # add item price to running total
  end

  def show_total
    out_total = "£#{'%.2f' % @total}" # create new output variable to 2dp
    puts "your total is #{out_total}" # print output total
    out_total
  end
end
