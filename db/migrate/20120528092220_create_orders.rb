class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.datetime :completed_at
      t.datetime :ready_at
      t.datetime :provided_at
      t.datetime :paid_at
      t.belongs_to :table

      t.timestamps
    end
    add_index :orders, :table_id
  end
end
