
# main class
class Main
  attr_reader :till
  def initialize
    @till = Till.new # create a till on startup
    @command = ''
    @welcome_text = "Welcome\n" \
                 "Enter an item to start\n" \
                 "Enter 'q' at any time to quit or 't' to total\n"
  end

  def main
    puts @welcome_text
    until @command == 'q'
      @command = gets.chomp
      if @command == 't'
        total
        next
      else
        @till.scan(Item.new(@command.to_i))
        puts "#{@command} added to basket"
      end
    end
  end

  def sale
    puts 'Thank you!'
  end

  def scan(item)
    till.items.push(item)
  end

  def total
    puts "£#{'%.2f' % @till.total}" # puts total in correct format
  end
end
