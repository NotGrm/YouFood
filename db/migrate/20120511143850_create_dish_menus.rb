class CreateDishMenus < ActiveRecord::Migration
  def change
    create_table :dish_menus do |t|
      t.string :title
      t.date :begin_date
      t.date :end_date

      t.timestamps
    end
  end
end
