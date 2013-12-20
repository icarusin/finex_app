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

class Stock < ActiveRecord::Base
  attr_accessible :name, :price, :priceUnit, :quantity, :ticker
  
  before_save {|stock| stock.ticker = ticker.upcase}
  
  validates :name, presence: true, length: {maximum: 255}
  validates :ticker, presence: true, length: {maximum: 255}, uniqueness: {case_sensitive: false}
  
  
  
  
end
