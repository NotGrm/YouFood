class CreateZones < ActiveRecord::Migration
  def change
    create_table :zones do |t|
      t.string :name
      t.belongs_to :restaurant
      t.belongs_to :waiter

      t.timestamps
    end
    add_index :zones, :restaurant_id
    add_index :zones, :waiter_id
  end
end
