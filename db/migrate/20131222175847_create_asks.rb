class CreateAsks < ActiveRecord::Migration
  def change
    create_table :asks do |t|
      t.belongs_to :stock
      t.decimal :price
      t.integer :quantity
      t.integer :status
      t.integer :price_unit

      t.timestamps
    end
  end
end
