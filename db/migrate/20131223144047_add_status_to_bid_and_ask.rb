class AddStatusToBidAndAsk < ActiveRecord::Migration
  def change
	add_column :bids, :status, :integer
	add_column :asks, :status, :integer
  end
end
