class AddColumnsToUsersAdmin < ActiveRecord::Migration
  def change
  	add_column :admin_users, :username, :string
  	add_column :admin_users, :first_name, :string
  	add_column :admin_users, :last_name, :string
  	add_column :admin_users, :zone, :belongs_to
  end
end
