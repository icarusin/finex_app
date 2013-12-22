class CreateStockPrices < ActiveRecord::Migration
  def change
    create_table :stock_prices do |t|
      t.integer :stock_id
      t.datetime :transaction_time
      t.integer :bid_id
      t.integer :ask_id
      t.decimal :price
      t.integer :quantity
      t.integer :price_unit

      t.timestamps
    end
	add_index :stock_prices, [:stock_id, :transaction_time]
  end
end
