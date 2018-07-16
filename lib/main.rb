
# main class
class Main
  attr_reader :till
  def initialize
    @till = Till.new # create a till on startup, may add more tills
    @command = ''
    @welcome_text = "Welcome\n" \
                 "Enter an item to start\n" \
                 "Enter 'q' at any time to quit or 't' to total\n"
  end

  def main
    print_text(@welcome_text)
    until @command == 'q'
      @command = gets.chomp
      if @command == 't'
        total
        next
      else
        Item.new(@command.to_i)
      end
    end
  end

  def sale
    return raise 'no items in basket' unless @till.total != 0
    @till.process_sale
    print_text('Thank you!')
  end

  def scan(item)
    @till.scan(item)
    print_text("#{item.price} added to basket")
  end

  def print_text(text)
    print text
  end

  def total
    print_text("£#{'%.2f' % @till.total}") # puts total in correct format
  end
end
