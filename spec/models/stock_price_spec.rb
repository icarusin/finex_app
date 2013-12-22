require 'spec_helper'

describe StockPrice do
   let(:stock) { FactoryGirl.create(:stock) }
  before do
    # This code is wrong!
    @stockPrice = stock.stock_prices.build(bid_id: 1, ask_id: 1, price: 100.0, price_unit: 100, quantity: 50, transaction_time: 1.hour.ago)
  end

  subject { @stockPrice }

  it { should respond_to(:stock_id) }
  it { should respond_to(:stock) }
  it { should respond_to(:bid_id) }
  it { should respond_to(:ask_id) }
  it { should respond_to(:price) }
  it { should respond_to(:quantity) }
  
  its(:stock) { should == stock }
  
  it { should be_valid }

  describe "when stock_id is not present" do
    before { @stockPrice.stock_id = nil }
    it { should_not be_valid }
  end
  
end
