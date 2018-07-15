
class Till

    attr_accessor :items
    attr_accessor :total

    def initialize
        @items = [] # create an empty array of items
        @total = 0.00 # total is always zero
    end

    def show_total
        out_total = "£#{total}" # create new output variable in correect format
        puts "your total is #{out_total}" # print output total
        return out_total 
    end

end