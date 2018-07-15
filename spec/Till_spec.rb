require './lib/Till'
require './lib/Item'

describe Till do
    till = Till.new
    it 'can scan items' do
        i = Item.new
        till.items.push(i) # test adding item to array
        expect(till.items[-1]).to eq(i) #should equal last value in array
    end 

    it 'can add item costs to total' do
        total = 0 # our mock total object for testing
        5.times do
            rand = 1 + rand(200); total += rand # generate a random number and add to total
            expect(till).to respond_to(:total) # does method exist
            expect(till.total += rand).to eq(total) # is our total correct
        end
    end 

    it 'can display the total cost to customer' do
        expect(till).to respond_to(:show_total) # does method exist
        expect(till.show_total).to eq(till.total) # is the printed total correct
    end

    it 'can display prices in the correct format' do
        expect(till.show_total).to be_a(String) # should be a string
        expect(till.show_total.length).to eq(5) # should be 5 characters long
        expect(till.show_total[0]).to eq('£') # first char should be pound symbol
    end

end