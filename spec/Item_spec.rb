require './lib/Item'

describe Item do
    item = Item.new
    it 'has a price and can be checked' do
        expect(item).to respond_to(:price) # check if price variable exists
        expect(item.price).to be_an(Integer) # check if price is an integer
    end

end