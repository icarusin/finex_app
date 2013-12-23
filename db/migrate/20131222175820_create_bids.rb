class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :stock_id
      t.decimal :price
      t.integer :quantity
      t.integer :status
      t.integer :price_unit

      t.timestamps
    end
  end
end
