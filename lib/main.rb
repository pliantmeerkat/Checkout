# main class
class Main
  attr_reader :till
  def initialize
    @till = Till.new # create a till on startup
  end

  def main
    puts(
      "Welcome\n",
      "Enter an item to start\n",
      "Enter 'q' at any time to quit or 't' to total\n"
    )
    while true
      break if gets.chomp == 'q'
      total if gets.chomp == 't'
      @till.items.push(Item.new(gets.chomp.to_i))
    end
  end

  def sale
    puts 'Thank you!'
  end

  def exit
    puts 'Goodbye!'
  end

  def scan
    
  end

  def total
    puts "£#{'%.2f' % till.total}" # puts total in correct format
  end
end