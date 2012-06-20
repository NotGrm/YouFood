class CreateAssignements < ActiveRecord::Migration
  def change
    create_table :assignements do |t|
      t.references :dish_menu
      t.references :dish

      t.timestamps
    end
    add_index :assignements, :dish_menu_id
    add_index :assignements, :dish_id
  end
end
