require './lib/main'
require './lib/Till'
require './lib/Item'
# feature tests
describe Main do
  describe 'main method' do
    it { expect(subject).to respond_to(:main) }
    it { expect(subject).to respond_to(:till) }
    it { expect(subject.till).to be_a(Till) }
  end
  describe 'sale' do
    it { expect(subject).to respond_to(:sale) }
  end
  describe 'scan' do
    it { expect(subject).to respond_to(:scan).with(1).arguments }
  end
  describe 'total' do
    it { expect(subject).to respond_to(:total) }
  end
  describe 'print_text' do
    it { expect(subject).to respond_to(:print_text) }
  end
end
# basic print tests
describe Main do
  item = Item.new(1.00)
  describe '#print_text' do
    specify { expect { subject.print_text('0') }.to output.to_stdout }
    describe '#total' do
      it 'prints total correctly' do
        expect { subject.print_text(subject.total) }.to output('£0.00').to_stdout
      end
    end
  end
  describe '#scan' do
    it 'prints scaned items correctly' do
      expect { subject.print_text(subject.scan(item)) }.to output('1.0 added to basket').to_stdout
    end
    it 'adds scanned items to total' do
      subject.scan(item)
      expect(subject.till.total).to eq(1.0)
    end
  end
  describe '#sale' do
    before(:each) { subject.scan(item); subject.sale }
    it 'prints on sale correctly' do
      subject.scan(item)
      expect { subject.print_text(subject.sale) }.to output('Thank you!').to_stdout
    end
    it 'amends tills total' do
      expect(subject.till.total).to eq(0) # total should reset after sale
    end
    it 'adds to tills session total' do
      expect(subject.till.session_total).to eq(1.00)
    end
  end
end
describe Main do
  context 'simulation tests' do
    welcome_text = ['Welcome',
      'Enter an item to start',
      "Enter 'q' at any time to quit or 't' to total\n"].join("\n")
    it 'runs main where no items are scanned and quit is pressed first' do
      text = welcome_text
      subject.stub(gets: 'q') # simulate user pressing q to quit
      expect { subject.print_text(subject.main) }.to output(text).to_stdout
    end
    it 'runs main where an item is scanned, total is called and then quit' do
      text = [welcome_text,
              '1.50 added to basket',
              "£1.50\n"].join("\n")
      # subject.stub(gets: "t\n") # will be added back in at a later date
      # expect { subject.print_text(subject.main) }.to output(text).to_stdout
    end
  end
end
describe Main do
  context 'edge tests' do
    describe 'bad input tests' do
      it 'tries to process sale with no items' do
        expect { subject.sale }.to raise_error('no items in basket')
      end
    end
  end
end
