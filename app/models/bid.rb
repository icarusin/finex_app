class Bid < ActiveRecord::Base
  attr_accessible :price, :quantity, :stock_id
  
  belongs_to :stock

  validates :price, presence: true  
  validates :quantity, presence: true  
  validates :stock_id, presence: true
 
end
