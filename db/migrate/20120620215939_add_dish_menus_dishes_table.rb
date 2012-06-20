class AddDishMenusDishesTable < ActiveRecord::Migration
  def change
  	create_table "dish_menus_dishes", :id => false, :force => true do |t|
      t.integer "dish_menu_id"
      t.integer "dish_id"
	end
  end
end
