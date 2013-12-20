class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :ticker
      t.string :name
      t.integer :quantity
      t.decimal :price
      t.integer :priceUnit

      t.timestamps
    end
  end
end
