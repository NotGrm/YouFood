class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.decimal :price_ht
      t.decimal :tva
      t.string :description
      t.belongs_to :category
      t.belongs_to :country

      t.timestamps
    end
    add_index :dishes, :category_id
    add_index :dishes, :country_id
  end
end
