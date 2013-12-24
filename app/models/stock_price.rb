class StockPrice < ActiveRecord::Base
  
  MATCH_BID_ASK_QUERY = "select b.id, a.id, b.stock_id, b.created_at, a.created_at from bids b, asks a where b.stock_id = a.stock_id and b.price = a.price
                                   and b.status = 200 and a.status = 200 order by b.created_at, a.created_at ASC";
  
  attr_accessible :ask_id, :bid_id, :price, :price_unit, :quantity, :transaction_time
  
  belongs_to :stock
  
  validates :stock_id, presence: true
  validates :bid_id, presence: true
  validates :ask_id, presence: true
  validates :price, presence: true
  validates :transaction_time, presence: true
  validates :quantity, presence: true
  
  default_scope order: 'stock_prices.transaction_time DESC'
  
end
