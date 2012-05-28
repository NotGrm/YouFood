class AddTypeToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :type, :string
  end
end
