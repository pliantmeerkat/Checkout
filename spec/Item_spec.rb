require './lib/Item'

describe Item do
    item = Item.new
    it 'has a price and can be checked' do
        expect(item).to respond_to(:price) # check if price variable exists
        expect(item.price).to be_an(Integer) # check if price is an integer
    end
    
    it 'can display correct price to customer' do
        expect(item).to respond_to(:show_price) # can display price
        expect(item.show_price).to eq(item.price) # is shwoing the correct price
    end
end