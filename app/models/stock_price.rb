class StockPrice < ActiveRecord::Base
  attr_accessible :ask_id, :bid_id, :price, :price_unit, :quantity, :transaction_time
  
  belongs_to :stock
  
  validates :stock_id, presence: true
  validates :bid_id, presence: true
  validates :ask_id, presence: true
  validates :price, presence: true
  validates :transaction_time, presence: true
  validates :quantity, presence: true
  
  default_scope order: 'stock_prices.transaction_time ASC'
  
end
