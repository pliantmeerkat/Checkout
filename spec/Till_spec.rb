require './lib/Till'
require './lib/Item'

describe Till do
  after(:each) do # run formatting tests after every example
    expect(subject.show_total.length).to be > 4 # at least 5 chars long
    expect(subject.show_total[0]).to eq('£') # first char should be pound
    expect(subject.show_total[-3]).to eq('.') # 3rd last character is .
  end
  item = Item.new
  describe 'can scan items' do
    it { expect(subject).to respond_to(:scan).with(1).argument } # can scan
    it 'can scan correctly' do
      subject.scan(item) # scan an item
      expect(subject.items[-1]).to eq(item) # should equal last value in array
    end
  end
  describe '#session_total' do
    it { expect(subject).to respond_to(:session_total) } # checks for session
  end
  describe '#process_sale' do
    it { expect(subject).to respond_to(:process_sale) } # can process sale
  end
  describe 'adding items to total tests' do
    it 'methods exist' do
      expect(subject).to respond_to(:total) # does method exist
    end
    5.times do # run this test 5 times
      it 'can add an item at random price to total' do
        # do this 5 times at different prices
        rand = 1 + rand(200); item.price = rand # random price for item
        subject.scan(item) # scan our item
        expect(subject.total).to eq(item.price) # is our total correct
      end
    end
  end
  describe 'can display the total cost to customer' do
    it { expect(subject).to respond_to(:show_total) } # does method exist
  end
end
describe Till do
  describe 'sales tests' do
    till = Till.new
    describe 'can process a sale correctly' do
      till.scan(Item.new(2.12))
      till.process_sale
      it { expect(till.total).to eq 0 }
      it { expect(till.session_total).to eq(2.12) }
    end
    it 'can process two sales correctly' do

    end
  end
end
describe Till do
  describe 'random tests' do
    it 'can add 10 items to the list at the same price' do
      10.times do |_|
        subject.scan(Item.new(5.00)) # scan 10 items at 5.00
      end
      expect(subject.total).to eq(50) # should be 50
    end
    3.times do |_| # run test three times
      it 'can add 10 items at different prices' do
        total = 0.00 # moch total object
        10.times do |_|
          price = rand(0.01...200.00) # randomise price
          subject.scan(Item.new(price)) # scan item
          total += price # add price to local total object
        end
        expect(subject.total).to eq(total) # totals should match
      end
    end
  end
end
