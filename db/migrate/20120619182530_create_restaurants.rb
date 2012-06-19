class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address_1
      t.string :address_2
      t.string :zip_code
      t.string :city

      t.timestamps
    end
  end
end
