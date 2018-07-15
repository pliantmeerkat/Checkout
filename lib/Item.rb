
class Item

    attr_accessor :price

    def initialize(price=0)
        @price = price
    end

    def show_price
        print "£#{@price}"
        return @price
    end

end