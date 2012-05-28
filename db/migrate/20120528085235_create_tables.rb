class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.integer :number
      t.belongs_to :zone

      t.timestamps
    end
    add_index :tables, :zone_id
  end
end
