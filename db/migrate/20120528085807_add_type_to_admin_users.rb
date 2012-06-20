class AddTypeToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :type, :string
  end

  Administrator.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password', :first_name => "John", :last_name => "Doe")
end
