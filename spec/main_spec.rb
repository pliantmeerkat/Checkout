require './lib/main'
require './lib/Till'
require './lib/Item'

describe Main do
  describe 'main method' do
    it { expect(subject).to respond_to(:main) }
    it { expect(subject).to respond_to(:till) }
    it { expect(subject.till).to be_a(Till) }
  end
  describe 'sale' do
    it { expect(subject).to respond_to(:sale) }
    it 'should print message on sale' do
      expect(STDOUT).to receive(:puts).with('Thank you!')
      subject.sale
    end
  end
  describe 'exit' do
    it { expect(subject).to respond_to(:exit) }
    it 'should print message on exit' do
      expect(STDOUT).to receive(:puts).with('Goodbye!')
      subject.exit
    end
  end
  describe 'scan' do
    it { expect(subject).to respond_to(:scan) }
  end
  describe 'total' do
    it { expect(subject).to respond_to(:total) }
    it 'should print a total cost on total' do
      expect(STDOUT).to receive(:puts).with('£0.00') # default
      subject.total
    end
  end
end

describe Main do
  describe '#main' do
    it 'prints the correct output' do
      expect(STDOUT).to receive(:puts).with(
        "Welcome\n",
        "Enter an item to start\n",
        "Enter 'q' at any time to quit or 't' to total\n"
      )
      subject.main
    end
  end
end

=begin
describe Main do
  describe 'runtime tests' do
    till = Till.new # create a till to be used
    after(:each) do # reset till after each example
      till.items.clear
      till.total = 0
    end
    1.times do # run multiple times to check
      it 'can run a sale and output correctly on total' do
        expect(STDOUT).to receive(:puts).with(
          "Welcome\n",
          "Enter an item to start\n",
          "Enter 'q' at any time to quit or 't' to total\n"
        )
        # subject.main
      end
      it 'can run a sale with > 2 items and output correctly on total' do

      end
    end
    it 'can run a sale where no items are entered and exit is called' do
    
    end
    it 'can run a sale where items are entered and exit is called' do

    end
  end
end
=end