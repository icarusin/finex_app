class AddIndexToStockTicker < ActiveRecord::Migration
  def change
	add_index :stocks, :ticker, unique: true
  end
end
