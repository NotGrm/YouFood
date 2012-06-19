class AddRestaurantToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :restaurant_id, :integer
    add_index :admin_users, :restaurant_id
  end
end
