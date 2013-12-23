class Ask < ActiveRecord::Base
  attr_accessible :price, :quantity, :stock_id, :status

  belongs_to :stock

  validates :price, presence: true  
  validates :quantity, presence: true  
  validates :stock_id, presence: true
  validates :status, presence: true

end
