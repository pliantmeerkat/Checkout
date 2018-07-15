require './lib/Item'

describe Item do
  it 'has a price and can be checked' do
    expect(subject).to respond_to(:price) # check if price variable exists
  end
  it 'converts integer inputs into floats' do
    item = Item.new(50) # create a new item with int price
    expect(item.price).to be_an(Float) # should be a float now
  end
end
