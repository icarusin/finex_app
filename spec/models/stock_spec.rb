# == Schema Information
#
# Table name: stocks
#
#  id         :integer          not null, primary key
#  ticker     :string(255)
#  name       :string(255)
#  quantity   :integer
#  price      :decimal(, )
#  priceUnit  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Stock do
  before { @stock = Stock.new(name: "Citibank N.A.", ticker: "CITI.NS", quantity: 1000, price: 100.00, priceUnit: 100)}

  subject {@stock}

  it {should respond_to(:name)}
  it {should respond_to(:ticker)}

  it {should be_valid}

  describe "when name is not present" do
    before {@stock.name = " "}
    it { should_not be_valid}
  end

  describe "when ticker is not present" do
    before {@stock.ticker = " "}
    it { should_not be_valid}
  end

  describe "when name is too long" do
    before {@stock.name = "a" * 300}
    it { should_not be_valid}
  end

  describe "when ticker is too long" do
    before {@stock.ticker = "a" * 300}
    it { should_not be_valid}
  end
  
  describe "when ticker is already taken" do
    before do
      stock_with_same_ticker = @stock.dup
      stock_with_same_ticker.ticker = @stock.ticker.upcase
      stock_with_same_ticker.save
    end
    
    it {should_not be_valid}
  end

end
