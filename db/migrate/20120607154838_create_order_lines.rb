class CreateOrderLines < ActiveRecord::Migration
  def change
    create_table :order_lines do |t|
      t.integer :quantity
      t.belongs_to :dish
      t.belongs_to :order

      t.timestamps
    end
    add_index :order_lines, :dish_id
  end
end
