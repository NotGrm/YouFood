class CreateAssignements < ActiveRecord::Migration
  def change
    create_table :assignements do |t|
      t.references :menu
      t.references :dish

      t.timestamps
    end
    add_index :assignements, :menu_id
    add_index :assignements, :dish_id
  end
end
